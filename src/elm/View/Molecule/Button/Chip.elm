module View.Molecule.Button.Chip exposing (view)

import Types.Styles exposing (..)
import Types.Styles.Clickable exposing (..)
import View.Atom.Clickable as Clickable
import View.Molecule.Chip as Chip


view : State -> Int -> RootElement msg
view state price =
    Clickable.view { bgPallet = Nothing } state <|
        Chip.view price
