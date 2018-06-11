module View.Molecule.CardBox exposing (view)

import Colors exposing (Hue(Orange), Shade(..))
import Element exposing (..)
import Element.Attributes exposing (..)
import Styles.Types exposing (..)
import Types exposing (Card, Point(..))
import Types.Card exposing (point)
import View.Atom.PointLabel as PointLabel exposing (pointLabelDefault)
import View.Molecule.Cards as Cards exposing (Align(..))


view : List Card -> Element Styles Variation msg
view cards =
    case cards of
        [] ->
            layout Darken1 empty empty

        _ ->
            layout Lighten2
                (Cards.view
                    (case point cards of
                        Bust ->
                            Folding

                        _ ->
                            Slanting
                    )
                    cards
                )
                (PointLabel.view pointLabelDefault cards)


layout :
    Shade
    -> Element Styles Variation msg
    -> Element Styles Variation msg
    -> Element Styles Variation msg
layout shade cardsView pointLabelView =
    column None
        [ center, width <| px 100 ]
        [ column Frame
            [ vary (ShadeVar shade) True
            , width <| px 100
            , height <| px 150
            , verticalCenter
            , center
            ]
            [ cardsView ]
        , column None
            [ height <| px 40, verticalCenter ]
            [ pointLabelView ]
        ]
