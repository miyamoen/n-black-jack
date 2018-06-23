module View.Atom.Button exposing (Config, view)

import Color.Pallet exposing (Pallet)
import Element exposing (..)
import Element.Attributes exposing (..)
import Element.Utils exposing (maybeVary)
import Types.Styles exposing (..)
import Types.Styles.Button exposing (..)


type alias Config a =
    { a | pallet : Maybe Pallet }


view : Config a -> State -> RootElement msg -> RootElement msg
view { pallet } state element =
    node "button" <|
        row (Button state)
            [ padding 10
            , center
            , verticalCenter
            , maybeVary PalletVar pallet
            ]
            [ element ]
