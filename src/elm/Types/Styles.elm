module Types.Styles exposing (..)

import Color.Chip as Chip
import Color.Pallet exposing (Hue, Pallet, Shade)
import Element exposing (Element)
import Types exposing (Suit)
import Types.Styles.Text as Text exposing (FontStyle)


type alias RootElement msg =
    Element Styles Variation msg


type Styles
    = None
    | Frame
    | Text
    | Chip Chip.Pallet
    | Card Suit
    | Button
    | Icon Pallet
    | AccountCard
    | Avatar
    | ActionButton State
    | ChipButton State
    | TableBoard
    | ModalBack


type Variation
    = TextVar Text.Variation
    | ShapeVar Shape
    | ShadeVar Shade
    | HueVar Hue
    | PalletVar Pallet
    | SubPalletVar Pallet


type Shape
    = Rectangle
    | Circle
    | Semicircle


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
