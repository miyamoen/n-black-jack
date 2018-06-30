module Types.Styles exposing (..)

import Color.Pallet exposing (Hue, Pallet, Shade)
import Element exposing (Element)
import Types.Styles.Button as Button
import Types.Styles.Frame as Frame
import Types.Styles.Selector as Selector
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
    | Icon
    | AccountCard
    | Avatar
    | Selector Selector.State
    | Board
    | ModalBack


type Variation
    = TextVar Text.Variation
    | SymbolVar Symbol.Variation
    | FrameVar Frame.Variation
    | ShadeVar Shade
    | HueVar Hue
    | PalletVar Pallet
    | SubPalletVar Pallet
