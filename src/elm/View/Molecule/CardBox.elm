module View.Molecule.CardBox exposing (view)

import Colors exposing (Hue(Orange), Shade(..))
import Element exposing (..)
import Element.Attributes exposing (..)
import Styles.Types exposing (..)
import Types exposing (Card, Point(..))
import Types.Card exposing (point)
import View.Atom.PointLabel as PointLabel
import View.Molecule.Cards as Cards exposing (Align(..))


view : List Card -> Element Styles Variation msg
view cards =
    case cards of
        [] ->
            el Frame
                [ vary (ShadeVar Darken1) True
                , width <| px 200
                , height <| px 200
                ]
                empty

        _ ->
            column Frame
                [ vary (ShadeVar Lighten2) True
                , width <| px 180
                , height <| px 190
                , alignBottom
                , center
                ]
                [ Cards.view
                    (case point cards of
                        Bust ->
                            Folding

                        _ ->
                            Slanting
                    )
                    cards
                , PointLabel.view PointLabel.default cards
                ]
