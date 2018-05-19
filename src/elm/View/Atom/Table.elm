module View.Atom.Table exposing (..)

import Colors exposing (Colors(..), Shade(..))
import Element exposing (..)
import Element.Attributes exposing (..)
import Styles exposing (Styles(..), Variation(..))


view : Element Styles Variation msg -> Element Styles Variation msg
view content =
    el None
        [ vary (BGColor Darken1 Green) True
        , padding 20
        , width fill
        , height fill
        ]
        content
