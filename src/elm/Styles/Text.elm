module Styles.Text
    exposing
        ( FontStyle(..)
        , Size(..)
        , fontStyles
        , sizes
        , style
        )

import Style exposing (..)
import Style.Font as Font


type Size
    = Large
    | Medium
    | Small
    | Tiny


sizes : List Size
sizes =
    [ Large, Medium, Small, Tiny ]


type FontStyle
    = Regular
    | RegularItaric
    | Bold
    | BoldItaric


fontStyles : List FontStyle
fontStyles =
    [ Regular, RegularItaric, Bold, BoldItaric ]


style : FontStyle -> Size -> List (Property style variation)
style fs s =
    size s :: fontStyle fs


fontStyle : FontStyle -> List (Property style variation)
fontStyle fs =
    case fs of
        Regular ->
            []

        RegularItaric ->
            [ Font.italic ]

        Bold ->
            [ Font.bold ]

        BoldItaric ->
            [ Font.bold, Font.italic ]


size : Size -> Property class variation
size s =
    case s of
        Large ->
            Font.size 40

        Medium ->
            Font.size 30

        Small ->
            Font.size 16

        Tiny ->
            Font.size 12
