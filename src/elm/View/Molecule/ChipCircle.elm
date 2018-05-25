module View.Molecule.ChipCircle exposing (view)

import Colors exposing (Shade(..))
import Element exposing (..)
import Styles exposing (Styles, Variation)
import View.Atom.Chip as Chip
import View.Atom.Circle as Circle


view : Maybe Int -> Element Styles Variation msg
view mPrice =
    case mPrice of
        Just price ->
            if price <= 0 then
                Circle.view Darken2 <| Chip.view price
            else
                Circle.view Lighten2 <| Chip.view price

        Nothing ->
            Circle.view Darken1 empty
