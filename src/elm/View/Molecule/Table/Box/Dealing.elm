module View.Molecule.Table.Box.Dealing exposing (view)

import Color.Pallet exposing (..)
import Element exposing (..)
import Element.Attributes exposing (..)
import Model.Card exposing (point)
import Types exposing (Card, Point(..))
import Types.Styles exposing (..)
import Types.Styles.Cards exposing (..)
import Types.Styles.Text exposing (..)
import View.Atom.Text as Text
import View.Molecule.Cards as Cards
import View.Atom.Text.Point as Point


view : List Card -> RootElement msg
view cards =
    case cards of
        [] ->
            layout Darken1 empty empty

        _ ->
            layout Lighten2
                (Cards.view
                    (case point cards of
                        Bust ->
                            { align = Folding }

                        _ ->
                            { align = Slanting }
                    )
                    cards
                )
                (Point.view textConfig cards)


layout : Shade -> RootElement msg -> RootElement msg -> RootElement msg
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


textConfig : Text.Config {}
textConfig =
    { style = BoldItaric
    , size = Medium
    , line = OneLine
    , align = Center
    , pallet = Just <| Pallet Orange Lighten1
    , onTable = True
    }
