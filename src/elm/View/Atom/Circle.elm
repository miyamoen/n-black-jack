module View.Atom.Circle exposing (view)

import Colors exposing (Colors(..), Shade(..))
import Element exposing (..)
import Element.Attributes exposing (..)
import Styles exposing (Styles(..), Variation(..))


view : Element Styles Variation msg -> Element Styles Variation msg
view content =
    column Circle
        [ vary (BorderColor Lighten1 Orange) True
        , width <| px 200
        , height <| px 200
        , center
        , verticalCenter
        ]
        [ content ]
