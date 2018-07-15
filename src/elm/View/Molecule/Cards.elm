module View.Molecule.Cards exposing (Config, view)

import Element exposing (..)
import Element.Attributes exposing (height, moveRight, moveUp, px, width)
import Types.Card exposing (Card)
import Types.Styles exposing (RootElement, Styles(..))
import Types.Styles.Cards exposing (Align(..))
import View.Atom.Card as Card


type alias Config a =
    { a | align : Align }


view : Config a -> List Card -> RootElement msg
view { align } cards =
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
