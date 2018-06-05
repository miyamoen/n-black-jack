module View.Molecule.ChipCircle exposing (view)

import Colors exposing (Shade(..))
import Element exposing (..)
import Element.Attributes exposing (..)
import Styles.Types exposing (Shape(Circle), Styles(Frame), Variation(ShadeVar, ShapeVar))
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
        , width <| px 150
        , height <| px 150
        , center
        , verticalCenter
        ]
        [ content ]
