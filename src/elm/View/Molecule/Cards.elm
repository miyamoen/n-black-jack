module View.Molecule.Cards exposing (Align(..), view)

import Element exposing (..)
import Element.Attributes exposing (height, moveRight, moveUp, px, width)
import Styles exposing (Styles(..), Variation)
import Types exposing (Card)
import View.Atom.Card as Card


type Align
    = Slanting
    | Vertical
    | Horizontal
    | Folding


view : Align -> List Card -> Element Styles Variation msg
view align cards =
    let
        ( dRight, dUp ) =
            case align of
                Horizontal ->
                    ( 20, 0 )

                Slanting ->
                    ( 20, 20 )

                Vertical ->
                    ( 0, 20 )

                Folding ->
                    ( 0, 10 )
    in
    el None [ width <| px 70, height <| px 110 ] empty
        |> within
            (List.indexedMap
                (\index card ->
                    el None
                        [ moveRight (toFloat index * dRight)
                        , moveUp (toFloat index * dUp)
                        ]
                    <|
                        Card.view card
                )
             <|
                List.reverse cards
            )
