module Styles.ActionButton exposing (styles)

import Color.Pallet as Pallet exposing (Hue(..), Pallet(..), Shade(..))
import List.Extra exposing (lift2)
import Style exposing (Property, Style, style, variation)
import Style.Animation as Animation exposing (animations, defaultAnimation)
import Style.Border as Border
import Style.Color as Color
import Style.Sheet exposing (mix)
import Types.Styles exposing (..)


styles : Style Styles Variation
styles =
    lift2 style Pallet.hues states
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
                        Pallet.color_ hue Darken2
                in
                [ Color.border color
                , Color.text color
                ]

            Active ->
                let
                    color =
                        Pallet.color_ hue Lighten2
                in
                [ Color.border color
                , Color.text color
                ]

            Selected ->
                let
                    color =
                        Pallet.color_ hue Lighten2
                in
                [ Color.border color
                , Color.text <| Pallet.color White
                , Color.background color
                ]

            Confirmed ->
                let
                    color =
                        Pallet.color_ hue Lighten1
                in
                [ Color.border color
                , Color.text <| Pallet.color White
                , Color.background color
                ]
