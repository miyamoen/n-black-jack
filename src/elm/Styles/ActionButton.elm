module Styles.ActionButton exposing (styles)

import Colors exposing (Hue(Mono, Orange), Shade(..), hues)
import List.Extra exposing (lift2)
import Style exposing (Property, Style, style, variation)
import Style.Animation as Animation exposing (animations, defaultAnimation)
import Style.Border as Border
import Style.Color as Color
import Style.Sheet exposing (mix)
import Styles.Types exposing (..)


styles : Style Styles Variation
styles =
    lift2 style hues states
        |> mix


style : Hue -> State -> Style Styles Variation
style hue state =
    Style.style (ActionButton state)
        [ Border.rounded 100
        , Border.all 5
        , animations <|
            case state of
                Active ->
                    [ { defaultAnimation
                        | name = "blink"
                        , iteration = Animation.Infinite
                        , duration = 1000
                        , direction = Animation.Alternate
                        , fill = Animation.Both
                      }
                    ]

                _ ->
                    []
        , color hue state
        ]


color : Hue -> State -> Property class Variation
color hue state =
    variation (HueVar hue) <|
        case state of
            Inactive ->
                let
                    color =
                        Colors.color { hue = hue, shade = Darken2 }
                in
                [ Color.border color
                , Color.text color
                ]

            Active ->
                let
                    color =
                        Colors.color { hue = hue, shade = Lighten2 }
                in
                [ Color.border color
                , Color.text color
                ]

            Selected ->
                let
                    color =
                        Colors.color { hue = hue, shade = Lighten2 }
                in
                [ Color.border color
                , Color.text <| Colors.color { hue = Mono, shade = Lighten2 }
                , Color.background color
                ]

            Confirmed ->
                let
                    color =
                        Colors.color { hue = hue, shade = Lighten1 }
                in
                [ Color.border color
                , Color.text <| Colors.color { hue = Mono, shade = Lighten2 }
                , Color.background color
                ]
