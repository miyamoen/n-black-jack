module Stories.Element exposing (..)

import Element exposing (..)
import Html exposing (Html, div)
import Styles exposing (styleSheet)
import Styles.Types exposing (Styles, Variation)
import View.Symbols as Symbols


toHtml : Element Styles Variation msg -> Html msg
toHtml element =
    layout styleSheet element


toHtmlWithSymbol : Element Styles Variation msg -> Html msg
toHtmlWithSymbol element =
    div []
        [ layout styleSheet element
        , Symbols.view
        ]
