module Styles.Types exposing (..)

import Colors exposing (Colors, Hue, Shade)
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
    | AccountCard
    | Avatar
    | ActionButton State
    | PlayerField
    | Table


type Variation
    = ShapeVar Shape
    | ShadeVar Shade
    | HueVar Hue
    | ColorVar Colors
    | SubColorVar Colors


type Shape
    = Rectangle
    | Circle
    | Semicircle


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


type State
    = Inactive
    | Active
    | Selected
    | Confirmed


states : List State
states =
    [ Inactive
    , Active
    , Selected
    , Confirmed
    ]
