module View.Molecule.Button.Chip exposing (view)

import Element exposing (..)
import Types.Styles exposing (..)
import Types.Styles.Button exposing (..)
import View.Atom.Button as Button
import View.Molecule.Chip as Chip


view : State -> Int -> Element Styles Variation msg
view state price =
    Button.view { bgPallet = Nothing } state <|
        Chip.view price
