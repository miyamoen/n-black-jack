module View.Molecule.Betting.Button exposing (Data, view)

import Element exposing (..)
import PushableData as PD exposing (PushableData)
import Types exposing (Limit)
import Types.Firebase as Firebase
import Types.Styles exposing (..)
import Types.Styles.Button exposing (..)
import View.Molecule.Button.Chip as ChipButton


type alias Data a =
    { a
        | price : Int
        , bettingLimit : Limit
        , betting : PushableData Int Firebase.Error
    }


view : Data a -> Element Styles Variation msg
view data =
    ChipButton.view (state data) data.price


state : Data a -> State
state { price, bettingLimit, betting } =
    if PD.local betting + price <= bettingLimit.max then
        Enable
    else
        Disable
