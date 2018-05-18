module Styles exposing (Styles(..), Variation(..), styleSheet)

import Colors exposing (..)
import Style exposing (..)
import Style.Color as Color
import Style.Font as Font
import Styles.Text as Text


type Styles
    = None
    | Title Text.FontStyle Text.Size
    | Text Text.FontStyle Text.Size


type Variation
    = BGColor Shade Colors


styleSheet : StyleSheet Styles Variation
styleSheet =
    Style.styleSheet
        ([ style None
            bgColors
         ]
            ++ titles
            ++ texts
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


lift2 : (a -> b -> c) -> List a -> List b -> List c
lift2 f la lb =
    la
        |> List.concatMap
            (\a -> lb |> List.map (\b -> f a b))
