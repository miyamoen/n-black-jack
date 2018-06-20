module Styles.Frame exposing (styles)

import Color.Pallet as Pallet exposing (Hue(Orange), Shade(Main))
import Style exposing (Property, Style, style, variation)
import Style.Border as Border
import Style.Color as Color
import Types.Styles exposing (..)


styles : Style Styles Variation
styles =
    style Frame <|
        [ Border.all 5
        , Border.rounded 10
        , Border.dashed
        , Color.border <| Pallet.color_ Orange Main
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
            ++ List.map color Pallet.shades


color : Shade -> Property class Variation
color shade =
    variation (ShadeVar shade)
        [ Color.border <| Pallet.color_ Orange shade ]
