module Styles exposing (styleSheet)

import Color
import Colors exposing (..)
import Colors.Chip as Chip
import Style exposing (..)
import Style.Border as Border
import Style.Color as Color
import Style.Shadow as Shadow
import Style.Sheet exposing (mix)
import Styles.ActionButton as ActionButton
import Styles.Button as Button
import Styles.Font as Font
import Styles.Frame as Frame
import Styles.PlayerField as PlayerField
import Styles.Types exposing (Styles(..), Variation(..))
import Types exposing (Suit(..))


styleSheet : StyleSheet Styles Variation
styleSheet =
    Style.styleSheet
        [ style None []
        , Frame.styles
        , Font.styles
        , Button.styles
        , chipStyles
        , cardStyles
        , colorBoxStyles
        , iconStyles
        , style AccountCard
            [ Shadow.box
                { offset = ( 0, 1 )
                , size = 0
                , blur = 2
                , color = Color.rgba 0 0 0 0.3
                }
            , Color.background <| Colors.color { hue = Mono, shade = Lighten2 }
            ]
        , style Avatar
            [ Border.rounded 50
            , Border.all 2
            , Color.border <| Colors.color { hue = Mono, shade = Lighten2 }
            , Color.background <| Colors.color { hue = Mono, shade = Lighten2 }
            ]
        , ActionButton.styles
        , PlayerField.styles
        , style Table
            [ Color.background <| Colors.color { hue = Green, shade = Main } ]
        ]


{-| to fill Svg
-}
chipStyles : Style Styles variation
chipStyles =
    Chip.colors
        |> List.map
            (\color ->
                style (Chip color)
                    [ Color.text <| Chip.color color ]
            )
        |> mix


{-| to fill Svg
-}
cardStyles : Style Styles variation
cardStyles =
    Types.suits
        |> List.map
            (\suit ->
                style (Card suit)
                    [ Color.text <|
                        Colors.color <|
                            { shade = Main
                            , hue =
                                case suit of
                                    Spade ->
                                        Blue

                                    Heart ->
                                        Red

                                    Club ->
                                        Blue

                                    Diamond ->
                                        Red
                            }
                    ]
            )
        |> mix


colorBoxStyles : Style Styles variation
colorBoxStyles =
    colors
        |> List.map
            (\color ->
                style (ColorBox color)
                    [ Color.background <| Colors.color color ]
            )
        |> mix


iconStyles : Style Styles variation
iconStyles =
    colors
        |> List.map
            (\color ->
                style (Icon color)
                    [ Color.text <| Colors.color color ]
            )
        |> mix
