module View.Molecule.ChipBox exposing (view)

import Colors exposing (Shade(..))
import Element exposing (..)
import Element.Attributes exposing (..)
import Styles.Types exposing (..)
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
    column Frame
        [ vary (ShadeVar shade) True
        , vary (ShapeVar Circle) True
        , width <| px 100
        , height <| px 100
        , center
        , verticalCenter
        ]
        [ el None [ moveUp 20, moveRight 10 ] content ]
