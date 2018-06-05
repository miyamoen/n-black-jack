module Styles.Frame exposing (styles)

import Colors exposing (Hue(Orange), Shade(Main))
import Style exposing (Property, Style, style, variation)
import Style.Border as Border
import Style.Color as Color
import Styles.Types exposing (..)


styles : Style Styles Variation
styles =
    style Frame <|
        [ Border.all 5
        , Border.rounded 10
        , Border.dashed
        , { hue = Orange, shade = Main }
            |> Colors.color
            |> Color.border
        , variation (ShapeVar Rectangle)
            []
        , variation (ShapeVar Circle)
            [ Border.rounded 2000 ]
        , variation (ShapeVar Semicircle)
            [ Border.roundBottomLeft 2000
            , Border.roundBottomRight 2000
            , Border.top 0
            ]
        ]
            ++ List.map color Colors.shades


color : Shade -> Property class Variation
color shade =
    { hue = Orange, shade = shade }
        |> Colors.color
        |> Color.border
        |> List.singleton
        |> variation (ShadeVar shade)
