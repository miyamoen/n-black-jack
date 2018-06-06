module View.Organism.PlayerField exposing (view)

import Element exposing (..)
import Element.Attributes exposing (..)
import Styles.Types exposing (..)
import Types exposing (Player)
import View.Molecule.AvatarWithLabel as AvatarWithLabel
import View.Molecule.CardBox as CardBox
import View.Molecule.ChipCircle as ChipCircle


view : Maybe Player -> Element Styles Variation msg
view player =
    column None
        [ spacing 20
        , center
        ]
        [ player
            |> Maybe.map .cards
            |> Maybe.withDefault []
            |> CardBox.view
        , player
            |> Maybe.andThen .bet
            |> ChipCircle.view
        , player
            |> Maybe.map (.account >> AvatarWithLabel.view)
            |> Maybe.withDefault empty
        ]
