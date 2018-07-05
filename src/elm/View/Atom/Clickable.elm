module View.Atom.Clickable exposing (Config, view)

import Color.Pallet exposing (Pallet)
import Element exposing (..)
import Element.Utils exposing (maybeVary)
import Types.Styles exposing (..)
import Types.Styles.Clickable exposing (..)


type alias Config a =
    { a | bgPallet : Maybe Pallet }


view : Config a -> State -> RootElement msg -> RootElement msg
view { bgPallet } state element =
    node "button" <|
        row (Clickable state)
            [ maybeVary PalletVar bgPallet ]
            [ element ]
