module Stories.Element exposing (..)

import Element exposing (..)
import Html exposing (Html, div)
import Styles exposing (Styles, Variation, styleSheet)
import View.Symbol exposing (symbols)


toHtml : Element Styles Variation msg -> Html msg
toHtml element =
    layout styleSheet element


toHtmlWithSymbol : Element Styles Variation msg -> Html msg
toHtmlWithSymbol element =
    div []
        [ layout styleSheet element
        , symbols
        ]
