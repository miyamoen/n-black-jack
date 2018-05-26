module Styles.Types
    exposing
        ( FontSize(..)
        , FontStyle(..)
        , Styles(..)
        , Variation(..)
        , fontSizes
        , fontStyles
        )

import Colors exposing (Colors, Shade)
import Colors.Chip as Chip


type Styles
    = None
    | Frame
    | Label FontStyle FontSize
    | Body FontStyle FontSize
    | Chip Chip.Colors
    | UserCard
    | Avatar
    | Button
    | ActionButton


type Variation
    = BGColor Colors
    | BorderColor Colors
    | TextColor Colors
    | CircleShape
    | ShadeVar Shade


type FontSize
    = Large
    | Medium
    | Small
    | Tiny


fontSizes : List FontSize
fontSizes =
    [ Large, Medium, Small, Tiny ]


type FontStyle
    = Regular
    | RegularItaric
    | Bold
    | BoldItaric


fontStyles : List FontStyle
fontStyles =
    [ Regular, RegularItaric, Bold, BoldItaric ]
