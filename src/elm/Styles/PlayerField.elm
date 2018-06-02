module Styles.PlayerField exposing (styles)

import Style exposing (..)
import Styles.Types exposing (..)


styles : Style Styles Variation
styles =
    style PlayerField <|
        List.map
            (\ag ->
                variation (AngleVar ag)
                    [ rotate <| degrees <| angle ag ]
            )
            angles


angle : Angle -> number
angle ag =
    case ag of
        South ->
            0

        Southeast ->
            -45

        East ->
            -90

        Southwest ->
            45

        West ->
            90
