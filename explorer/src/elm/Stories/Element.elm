module Stories.Element exposing (..)

import Element exposing (..)
import Html exposing (Html, div)
import Styles exposing (styleSheet)
import Types.Styles exposing (Styles, Variation)
import UIExplorer exposing (addUICategory, app, createUI, emptyUICategories)
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


toMain stories =
    emptyUICategories
        |> addUICategory "Main" [ createUI "Main" stories ]
        |> app
