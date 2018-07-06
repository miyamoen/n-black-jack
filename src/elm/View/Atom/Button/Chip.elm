module View.Atom.Button.Chip exposing (view)

import Types.Styles exposing (..)
import Types.Styles.Clickable exposing (..)
import View.Atom.Chip as Chip
import View.Atom.Clickable as Clickable


view : State -> Int -> RootElement msg
view state price =
    Clickable.view { bgPallet = Nothing } state <|
        Chip.view price
