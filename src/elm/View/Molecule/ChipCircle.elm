module View.Molecule.ChipCircle exposing (view)

import Colors exposing (Shade(..))
import Element exposing (..)
import Element.Attributes exposing (..)
import Styles.Types exposing (Styles(Frame), Variation(CircleShape, ShadeVar))
import View.Atom.Chip as Chip


view : Maybe Int -> Element Styles Variation msg
view mPrice =
    case mPrice of
        Just price ->
            if price <= 0 then
                circle Darken2 <| Chip.view price
            else
                circle Lighten2 <| Chip.view price

        Nothing ->
            circle Darken1 empty


circle : Shade -> Element Styles Variation msg -> Element Styles Variation msg
circle shade content =
    el Frame
        [ vary (ShadeVar shade) True
        , vary CircleShape True
        , width <| px 200
        , height <| px 200
        ]
        content
