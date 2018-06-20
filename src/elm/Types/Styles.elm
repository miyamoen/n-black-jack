module Types.Styles exposing (..)

import Color.Chip as Chip
import Color.Pallet exposing (Hue, Pallet, Shade)
import Types exposing (Suit)


type Styles
    = None
    | Frame
    | Label FontStyle FontSize
    | Body FontStyle FontSize
    | Chip Chip.Pallet
    | Card Suit
    | Button
    | Icon Pallet
    | AccountCard
    | Avatar
    | ActionButton State
    | ChipButton State
    | Table
    | TableText
    | ModalBack


type Variation
    = ShapeVar Shape
    | ShadeVar Shade
    | HueVar Hue
    | PalletVar Pallet
    | SubPalletVar Pallet


type Shape
    = Rectangle
    | Circle
    | Semicircle


type FontSize
    = Huge
    | Large
    | Medium
    | Small
    | Tiny


fontSizes : List FontSize
fontSizes =
    [ Huge, Large, Medium, Small, Tiny ]


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
