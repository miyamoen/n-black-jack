module Styles.Frame exposing (styles)

import Color.Pallet as Pallet exposing (Hue(Orange), Shade(Main))
import Style exposing (Property, Style, style, variation)
import Style.Border as Border
import Style.Color as Color
import Types.Styles as Root exposing (..)
import Types.Styles.Frame exposing (..)


styles : Style Styles Root.Variation
styles =
    style Frame <|
        [ Border.all 3
        , Border.rounded 10
        , Border.dashed
        , Color.border <| Pallet.color_ Orange Main
        , variation (FrameVar <| ShapeVar Rectangle)
            []
        , variation (FrameVar <| ShapeVar Circle)
            [ Border.rounded 2000 ]
        , variation (FrameVar <| ShapeVar Semicircle)
            [ Border.roundBottomLeft 2000
            , Border.roundBottomRight 2000
            , Border.top 0
            ]
        ]
            ++ List.map shade Pallet.shades


shade : Shade -> Property class Root.Variation
shade shade =
    variation (ShadeVar shade)
        [ Color.border <| Pallet.color_ Orange shade ]
