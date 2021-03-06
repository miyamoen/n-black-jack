module View.Molecule.Bet.Box exposing (Data, view)

import Element exposing (..)
import Element.Attributes exposing (..)
import Types exposing (..)
import Types.Firebase as Firebase
import Types.Styles exposing (..)
import Types.Styles.PlayBoard exposing (State(..))
import UpdatableData exposing (UpdatableData)
import View.Molecule.Bet.Board as Board
import View.Molecule.Bet.Frame as Frame


type alias Data a =
    { a
        | limit : Limit
        , chip : UpdatableData Int Firebase.Error
    }


view : State -> Data a -> RootElement msg
view state data =
    Frame.view state data
        |> below
            [ when (state == Open)
                (el None [ moveDown 10, center ] <|
                    Board.view data
                )
            ]
