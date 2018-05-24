module Styles exposing (Styles(..), Variation(..), styleSheet)

import Color
import Colors exposing (..)
import Colors.Chip as Chip
import List.Extra exposing (lift2)
import Style exposing (..)
import Style.Border as Border
import Style.Color as Color
import Style.Font as Font
import Style.Shadow as Shadow
import Styles.Text as Text


type Styles
    = None
    | Title Text.FontStyle Text.Size
    | Text Text.FontStyle Text.Size
    | Chip Chip.Colors
    | Circle
    | CardBox
    | UserCard
    | Avatar
    | Button


type Variation
    = BGColor Colors
    | BorderColor Colors
    | TextColor Colors


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
         , style CardBox
            ([ Border.all 5
             , Border.rounded 10
             , Border.dashed
             ]
                ++ borderColors
            )
         , style UserCard
            [ Shadow.box
                { offset = ( 0, 1 )
                , size = 0
                , blur = 2
                , color = Color.rgba 0 0 0 0.3
                }
            ]
         , style Avatar
            [ Border.rounded 40
            , Border.all 1
            , Color.border <|
                Colors.color { shade = Lighten2, hue = Mono }
            ]
         , style Button
            ([ Border.rounded 4
             ]
                ++ bgColors
            )
         ]
            ++ titles
            ++ texts
            ++ chips
        )


bgColors : List (Property style Variation)
bgColors =
    List.map
        (\color ->
            variation (BGColor color)
                [ Color.background <| Colors.color color ]
        )
        Colors.colors


textColors : List (Property style Variation)
textColors =
    List.map
        (\color ->
            variation (TextColor color)
                [ Color.text <| Colors.color color ]
        )
        Colors.colors


borderColors : List (Property style Variation)
borderColors =
    List.map
        (\color ->
            variation (BorderColor color)
                [ Color.border <| Colors.color color ]
        )
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
