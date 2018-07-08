module View.Molecule.Bet.Chip exposing (Data, view)

import Element exposing (..)
import Types exposing (Limit)
import Types.Firebase as Firebase
import Types.Styles exposing (..)
import Types.Styles.Clickable exposing (..)
import UpdatableData as UD exposing (UpdatableData)
import View.Atom.Button.Chip as ChipButton


type alias Data a =
    { a
        | price : Int
        , limit : Limit
        , chip : UpdatableData Int Firebase.Error
    }


view : Data a -> Element Styles Variation msg
view data =
    ChipButton.view (state data) data.price


state : Data a -> State
state { price, limit, chip } =
    if UD.local chip + price <= limit.max then
        Enable
    else
        Disable
