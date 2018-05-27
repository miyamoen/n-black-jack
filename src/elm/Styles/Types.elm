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
import Types exposing (Suit)


type Styles
    = None
    | ColorBox Colors
    | Frame
    | Label FontStyle FontSize
    | Body FontStyle FontSize
    | Chip Chip.Colors
    | Card Suit
    | Button
    | Icon Colors
    | UserCard
    | Avatar
    | ActionButton


type Variation
    = CircleShape
    | ShadeVar Shade
    | ColorVar Colors
    | SubColorVar Colors


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
