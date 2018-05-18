module Stories.Element exposing (..)

import Element exposing (..)
import Html exposing (Html)
import Styles exposing (Styles, Variation, styleSheet)


toHtml : Element Styles Variation msg -> Html msg
toHtml element =
    layout styleSheet element
