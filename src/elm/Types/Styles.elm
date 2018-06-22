module Types.Styles exposing (..)

import Color.Pallet exposing (Hue, Pallet, Shade)
import Element exposing (Element)
import Types.Styles.Symbol as Symbol
import Types.Styles.Text as Text


type alias RootElement msg =
    Element Styles Variation msg


type Styles
    = None
    | Frame
    | Text
    | Symbol
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
    | SymbolVar Symbol.Variation
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
