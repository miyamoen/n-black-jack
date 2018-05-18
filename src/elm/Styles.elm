module Styles exposing (..)

import Colors exposing (..)
import Style exposing (..)
import Style.Color as Color


type Styles
    = None


type Variation
    = BGColor Shade Colors


styleSheet : StyleSheet Styles Variation
styleSheet =
    Style.styleSheet
        [ style None
            bgColors
        ]


bgColor : Shade -> Colors -> Property style Variation
bgColor shade colors =
    variation (BGColor shade colors)
        [ Color.background <| Colors.color shade colors ]


bgColors : List (Property style Variation)
bgColors =
    List.concatMap
        (\shade -> List.map (bgColor shade) Colors.colors)
        Colors.shades
