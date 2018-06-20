module Styles.Button exposing (styles)

import Color.Pallet as Pallet exposing (Hue(Mono), Shade(Darken1))
import Style exposing (..)
import Style.Border as Border
import Style.Color as Color
import Style.Shadow as Shadow
import Style.Transition as Transition
import Types.Styles exposing (..)


styles : Style Styles Variation
styles =
    style Button
        ([ Border.rounded 4
         , buttonShadow 2
         , Transition.all
         , pseudo "active"
            [ translate 0 2 0
            , buttonShadow 0
            ]
         ]
            ++ bgColors
            ++ textColors
        )


bgColors : List (Property style Variation)
bgColors =
    List.map
        (\pallet ->
            variation (PalletVar pallet)
                [ Color.background <| Pallet.color pallet ]
        )
        Pallet.pallets


textColors : List (Property style Variation)
textColors =
    List.map
        (\pallet ->
            variation (SubPalletVar pallet)
                [ Color.text <| Pallet.color pallet ]
        )
        Pallet.pallets


buttonShadow : Float -> Property class variation
buttonShadow dy =
    Shadow.drop
        { offset = ( 0, dy )
        , blur = 0
        , color = Pallet.color_ Mono Darken1
        }
