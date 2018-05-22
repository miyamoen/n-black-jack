module View.Molecule.Cards exposing (Align(..), view)

import Element exposing (..)
import Element.Attributes exposing (moveRight, moveUp)
import Styles exposing (Styles(..), Variation)
import Types exposing (Card)
import View.Atom.Card as Card


type Align
    = Slanting
    | Vertical
    | Horizontal


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
    in
    el None [] empty
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
