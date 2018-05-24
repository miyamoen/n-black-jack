module View.Atom.Table exposing (..)

import Colors exposing (Hue(..), Shade(..))
import Element exposing (..)
import Element.Attributes exposing (..)
import Styles exposing (Styles(..), Variation(..))


view : Element Styles Variation msg -> Element Styles Variation msg
view content =
    el None
        [ vary (BGColor { shade = Darken1, hue = Green }) True
        , padding 20
        , width fill
        , height fill
        ]
        content
