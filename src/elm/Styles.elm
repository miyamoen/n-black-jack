module Styles exposing (Styles(..), Variation(..), styleSheet)

import Colors exposing (..)
import Colors.Chip as Chip
import List.Extra exposing (lift2)
import Style exposing (..)
import Style.Border as Border
import Style.Color as Color
import Style.Font as Font
import Styles.Text as Text


type Styles
    = None
    | Title Text.FontStyle Text.Size
    | Text Text.FontStyle Text.Size
    | Chip Chip.Colors
    | Circle


type Variation
    = BGColor Shade Colors
    | BorderColor Shade Colors
    | TextColor Shade Colors


styleSheet : StyleSheet Styles Variation
styleSheet =
    Style.styleSheet
        ([ style None (bgColors ++ textColors)
         , style Circle
            ([ Border.all 5
             , Border.rounded 100
             , Border.dashed
             ]
                ++ borderColors
            )
         ]
            ++ titles
            ++ texts
            ++ chips
        )


bgColors : List (Property style Variation)
bgColors =
    lift2
        (\shade colors ->
            variation (BGColor shade colors)
                [ Color.background <| Colors.color shade colors ]
        )
        Colors.shades
        Colors.colors


textColors : List (Property style Variation)
textColors =
    lift2
        (\shade colors ->
            variation (TextColor shade colors)
                [ Color.text <| Colors.color shade colors ]
        )
        Colors.shades
        Colors.colors


borderColors : List (Property style Variation)
borderColors =
    lift2
        (\shade colors ->
            variation (BorderColor shade colors)
                [ Color.border <| Colors.color shade colors ]
        )
        Colors.shades
        Colors.colors


titles : List (Style Styles variation)
titles =
    lift2 (\fs s -> style (Title fs s) (Text.style fs s))
        Text.fontStyles
        Text.sizes


texts : List (Style Styles variation)
texts =
    lift2
        (\fs s ->
            style (Text fs s)
                ([ Font.alignLeft
                 , Font.lineHeight 1.3
                 , Font.wordSpacing 3
                 ]
                    ++ Text.style fs s
                )
        )
        Text.fontStyles
        Text.sizes


chips : List (Style Styles variation)
chips =
    List.map
        (\color ->
            style (Chip color)
                [ Color.text <| Chip.color color ]
        )
        Chip.colors
