module View.Organism.PlayerField exposing (view)

import Element exposing (..)
import Element.Attributes exposing (..)
import Styles.Types exposing (..)
import Types exposing (Player)
import View.Molecule.AvatarWithLabel as AvatarWithLabel
import View.Molecule.CardBox as CardBox
import View.Molecule.ChipBox as ChipBox


view : Maybe Player -> Element Styles Variation msg
view player =
    column None
        [ spacing 20
        , center
        , width <| px 120
        ]
        [ player
            |> Maybe.map .cards
            |> Maybe.withDefault []
            |> CardBox.view
        , player
            |> Maybe.andThen .bet
            |> ChipBox.view
        , player
            |> Maybe.map (.account >> AvatarWithLabel.view)
            |> Maybe.withDefault empty
        ]
