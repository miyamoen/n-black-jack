module Styles.Selector exposing (styles)

import Color.Pallet as Pallet exposing (Hue(..), Pallet(..), Shade(..))
import Style exposing (Property, Style, cursor, style, variation)
import Style.Border as Border
import Style.Color as Color
import Style.Sheet exposing (mix)
import Types.Styles exposing (..)
import Types.Styles.Selector exposing (State(..))


styles : Style Styles Variation
styles =
    List.map style_ Pallet.hues
        |> mix


commonStyle : List (Property class variation)
commonStyle =
    [ Border.rounded 100
    , Border.all 5
    , cursor "pointer"
    ]


style_ : Hue -> Style Styles Variation
style_ hue =
    let
        toColor =
            Pallet.color_ hue
    in
    mix
        [ style (Selector Disable) <|
            [ variation (HueVar hue)
                [ Color.border <| toColor Darken2
                , Color.text <| toColor Darken2
                ]
            ]
                ++ commonStyle
        , style (Selector Enable) <|
            [ variation (HueVar hue)
                [ Color.border <| toColor Lighten2
                , Color.text <| toColor Lighten2
                ]
            ]
                ++ commonStyle
        , style (Selector Selected) <|
            [ variation (HueVar hue)
                [ Color.border <| toColor Lighten2
                , Color.background <| toColor Lighten2
                , Color.text <| Pallet.color_ Mono Lighten2
                ]
            ]
                ++ commonStyle
        , style (Selector Confirmed) <|
            [ variation (HueVar hue)
                [ Color.border <| toColor Main
                , Color.background <| toColor Main
                , Color.text <| Pallet.color_ Mono Lighten2
                ]
            ]
                ++ commonStyle
        ]
