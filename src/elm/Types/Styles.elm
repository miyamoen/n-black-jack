module Types.Styles exposing (..)

import Color.Pallet exposing (Hue, Pallet, Shade)
import Element exposing (Element)
import Types.Styles.ActionButton as ActionButton
import Types.Styles.Button as Button
import Types.Styles.Frame as Frame
import Types.Styles.Symbol as Symbol
import Types.Styles.Text as Text


type alias RootElement msg =
    Element Styles Variation msg


type Styles
    = None
    | Frame
    | Text
    | Symbol
    | Button Button.State
    | Icon Pallet
    | AccountCard
    | Avatar
    | ActionButton ActionButton.State
    | TableBoard
    | ModalBack


type Variation
    = TextVar Text.Variation
    | SymbolVar Symbol.Variation
    | FrameVar Frame.Variation
    | ShadeVar Shade
    | HueVar Hue
    | PalletVar Pallet
    | SubPalletVar Pallet
