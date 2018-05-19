module View.Molecule.ChipCircle exposing (view)

import Element exposing (..)
import Styles exposing (Styles, Variation)
import View.Atom.Circle as Circle
import View.Molecule.Chip as Chip


view : Maybe Int -> Element Styles Variation msg
view mPrice =
    case mPrice of
        Just price ->
            Circle.view <| Chip.view price

        Nothing ->
            Circle.view empty
