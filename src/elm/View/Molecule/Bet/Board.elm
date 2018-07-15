module View.Molecule.Bet.Board exposing (Data, view)

import Color.Pallet exposing (..)
import Element exposing (..)
import Element.Attributes exposing (..)
import Types exposing (Limit)
import Types.Firebase as Firebase
import Types.Styles exposing (..)
import Types.Styles.Clickable exposing (State(..))
import Types.Styles.Text exposing (Size(..))
import UpdatableData as UD exposing (UpdatableData)
import View.Atom.Button.Bet as BetButton
import View.Atom.Button.Close as CloseButton
import View.Molecule.Bet.Chips as Chips
import View.Molecule.Bet.Undos as Undos


type alias Data a =
    { a
        | limit : Limit
        , chip : UpdatableData Int Firebase.Error
    }


view : Data a -> RootElement msg
view ({ limit, chip } as data) =
    column Board
        [ vary (HueVar Orange) True, spacing 10, paddingXY 10 5 ]
        [ row None
            [ spacing 10, spread, alignBottom ]
            [ Undos.view { size = Tiny } <| 0 :: UD.resetValues chip
            , CloseButton.view { size = Small, pallet = Pallet Red Main }
                Enable
            ]
        , row None
            [ spacing 10, spread, alignBottom ]
            [ Chips.view data
            , BetButton.view { size = Large, pallet = Pallet Green Main } <|
                if UD.isPushable chip then
                    Enable
                else
                    Disable
            ]
        ]
