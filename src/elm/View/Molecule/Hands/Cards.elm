module View.Molecule.Hands.Cards exposing (Data, view)

import Color.Pallet exposing (..)
import Element exposing (..)
import Element.Attributes exposing (..)
import Model.Card exposing (point)
import Types exposing (Card, Point(..))
import Types.Styles exposing (..)
import Types.Styles.Cards exposing (..)
import View.Molecule.Cards as Cards


type alias Data a =
    { a | cards : List Card }


view : Data a -> RootElement msg
view { cards } =
    column Frame
        [ vary (ShadeVar <| shade cards) True
        , width <| px 100
        , height <| px 135
        , verticalCenter
        , center
        ]
        [ case cards of
            [] ->
                empty

            _ ->
                Cards.view { align = align cards } cards
        ]


align : List Card -> Align
align cards =
    case point cards of
        Bust ->
            Folding

        _ ->
            Slanting


shade : List Card -> Shade
shade cards =
    case cards of
        [] ->
            Darken1

        _ ->
            Lighten2
