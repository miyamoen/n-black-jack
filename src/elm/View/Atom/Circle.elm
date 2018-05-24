module View.Atom.Circle exposing (view)

import Colors exposing (Hue(..), Shade(..))
import Element exposing (..)
import Element.Attributes exposing (..)
import Styles exposing (Styles(..), Variation(..))


view : Shade -> Element Styles Variation msg -> Element Styles Variation msg
view shade content =
    column Circle
        [ vary (BorderColor { shade = shade, hue = Orange }) True
        , width <| px 200
        , height <| px 200
        , center
        , verticalCenter
        ]
        [ content ]
