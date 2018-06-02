module View.Organism.PlayerField exposing (Option, playerFieldDefault, view)

import Element exposing (..)
import Element.Attributes exposing (..)
import Styles.Types exposing (..)
import Types exposing (Player)
import View.Molecule.AvatarWithLabel as AvatarWithLabel
import View.Molecule.CardBox as CardBox
import View.Molecule.ChipCircle as ChipCircle


type alias Option =
    { angle : Angle }


playerFieldDefault : Option
playerFieldDefault =
    { angle = South }


view : Option -> Maybe Player -> Element Styles Variation msg
view { angle } player =
    column PlayerField
        [ spacing 20
        , center
        , vary (AngleVar angle) True
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
