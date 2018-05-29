module View.Atom.Text exposing (Option, description, label, textDefault)

import Colors exposing (Colors, Hue(Mono), Shade(Darken2))
import Element exposing (..)
import Element.Attributes exposing (alignLeft, spacing, vary)
import Styles.Types exposing (..)


type alias Option =
    { style : FontStyle
    , size : FontSize
    , color : Colors
    }


textDefault : Option
textDefault =
    { style = Regular
    , size = Small
    , color = Colors Mono Darken2
    }


label : Option -> String -> Element Styles Variation msg
label { style, size, color } content =
    node "label" <|
        el (Label style size) [ vary (ColorVar color) True ] <|
            text content


description : Option -> List String -> Element Styles Variation msg
description { style, size, color } contents =
    contents
        |> List.map
            (\content ->
                paragraph (Body style size)
                    [ vary (ColorVar color) True ]
                    [ text content ]
            )
        |> textLayout None [ spacing 10 ]
