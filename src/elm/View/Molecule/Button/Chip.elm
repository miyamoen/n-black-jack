module View.Molecule.Button.Chip exposing (view)

import Element exposing (full)
import Types.Styles exposing (..)
import Types.Styles.Button exposing (..)
import View.Atom.Button as Button
import View.Molecule.Chip as Chip


view : State -> Int -> RootElement msg
view state price =
    Button.view { bgPallet = Nothing } state <|
        full None [] <|
            -- Buttonに入ってるpaddingをfullで無効化
            Chip.view price
