module Styles.Button exposing (styles)

import Color
import Color.Pallet as Pallet exposing (Hue(Mono), Shade(..))
import Style exposing (..)
import Style.Border as Border
import Style.Color as Color
import Style.Filter as Filter
import Style.Shadow as Shadow
import Style.Sheet as Sheet
import Style.Transition as Transition
import Types.Styles exposing (..)
import Types.Styles.Button exposing (..)


styles : Style Styles Variation
styles =
    Sheet.mix
        [ style (Button Enable) <|
            [ cursor "pointer"
            , Border.rounded 5
            , Color.background <| Color.rgba 0 0 0 0
            , translate 0 -3 0
            , dropShadow { dy = 3, blur = 2 }
            , Transition.performant
            , pseudo "hover"
                [ translate 0 -5 0
                , dropShadow { dy = 5, blur = 2 }
                ]
            , pseudo "active"
                [ translate 0 0 0
                , dropShadow { dy = 0, blur = 0.5 }
                ]
            ]
                ++ bgColors
        , style (Button Disable) <|
            [ Filter.brightness 80
            , Border.rounded 5
            , Color.background <| Color.rgba 0 0 0 0
            ]
                ++ bgColors
        ]


bgColors : List (Property style Variation)
bgColors =
    List.map
        (\pallet ->
            variation (PalletVar pallet)
                [ Color.background <| Pallet.color pallet ]
        )
        Pallet.pallets


dropShadow : { dy : Float, blur : Float } -> Property class variation
dropShadow { dy, blur } =
    Shadow.drop
        { offset = ( 0, dy )
        , blur = blur
        , color = Pallet.color_ Mono Darken2
        }
