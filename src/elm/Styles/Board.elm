module Styles.Board exposing (styles)

import Color.Pallet as Pallet exposing (Shade, hues)
import Style exposing (..)
import Style.Background as Background
import Style.Border as Border
import Style.Color as Color
import Types.Styles exposing (..)


styles : Style Styles Variation
styles =
    style Board <|
        [ Color.background <| Pallet.color_ Pallet.Green Pallet.Main
        , Border.all 3
        , Border.rounded 10
        , Background.imageWith
            { src = "./argyle.png"
            , position = ( 0, 0 )
            , repeat = Background.repeat
            , size = Background.natural
            }
        ]
            ++ List.map color hues


color : Pallet.Hue -> Property class Variation
color hue =
    variation (HueVar hue)
        [ Color.background <| Pallet.color_ hue Pallet.Main ]
