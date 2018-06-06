module View.Molecule.DealerHand exposing (view)

import Element exposing (..)
import Element.Attributes exposing (..)
import Styles.Types exposing (..)
import Types exposing (Card, Point(..))
import View.Atom.Card as Card


view : List Card -> Element Styles Variation msg
view cards =
    el None [ width <| px 72, height <| px 110 ] empty
        |> within
            (case cards of
                hole :: up :: [] ->
                    [ el None [ moveRight -41 ] <| Card.view up
                    , el None [ moveRight 41 ] <| Card.view hole
                    ]

                _ ->
                    List.reverse cards
                        |> List.indexedMap
                            (\index card ->
                                el None [ moveRight <| -41 + 41 * toFloat index ] <|
                                    Card.view card
                            )
            )
