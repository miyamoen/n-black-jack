module View.Molecule.Bet.Circle exposing (view)

import Color.Pallet exposing (Shade(..))
import Element exposing (..)
import Element.Attributes exposing (..)
import Types.Styles exposing (..)
import Types.Styles.Frame exposing (..)
import View.Atom.Chip as Chip


view : Maybe Int -> RootElement msg
view mPrice =
    case mPrice of
        Just price ->
            if price < 0 then
                circle Darken2 <| Chip.view price
            else if price == 0 then
                circle Darken1 empty
            else
                circle Lighten2 <| Chip.view price

        Nothing ->
            circle Darken1 empty


circle : Shade -> RootElement msg -> RootElement msg
circle shade content =
    column Frame
        [ vary (ShadeVar shade) True
        , vary (FrameVar <| ShapeVar Circle) True
        , width <| px 85
        , height <| px 85
        , center
        , verticalCenter
        ]
        [ el None [ moveUp 20, moveRight 10 ] content ]
