module Styles.Button exposing (styles)

import Colors exposing (Hue(Mono), Shade(Darken1))
import Style exposing (..)
import Style.Border as Border
import Style.Color as Color
import Style.Shadow as Shadow
import Style.Transition as Transition
import Styles.Types exposing (..)


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
        (\color ->
            variation (ColorVar color)
                [ Color.background <| Colors.color color ]
        )
        Colors.colors


textColors : List (Property style Variation)
textColors =
    List.map
        (\color ->
            variation (SubColorVar color)
                [ Color.text <| Colors.color color ]
        )
        Colors.colors


buttonShadow : Float -> Property class variation
buttonShadow dy =
    Shadow.drop
        { offset = ( 0, dy )
        , blur = 0
        , color = Colors.color { hue = Mono, shade = Darken1 }
        }
