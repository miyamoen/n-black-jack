module View.Molecule.Bet.Frame exposing (Data, view)

import Element exposing (..)
import Element.Attributes exposing (..)
import Types.Firebase as Firebase
import Types.Styles exposing (..)
import Types.Styles.PlayBoard exposing (State(..))
import Types.Styles.Text exposing (Size(..))
import UpdatableData as UD exposing (UpdatableData)
import View.Atom.Icon.Check as CheckIcon
import View.Atom.Icon.Edit as EditIcon
import View.Atom.Icon.Error as ErrorIcon
import View.Atom.Icon.Loading as LoadingIcon
import View.Molecule.Bet.Circle as Circle


type alias Data a =
    { a | chip : UpdatableData Int Firebase.Error }


view : State -> Data a -> RootElement msg
view state { chip } =
    Circle.view
        (if state == Open then
            Just <| UD.local chip
         else if UD.isProcessing chip then
            UD.processValue chip
         else if UD.isError chip then
            UD.failedValue chip
         else
            UD.remote chip
        )
        |> onLeft
            [ el None [ moveUp 10 ] <|
                if state == Open then
                    EditIcon.view iconConfig
                else if UD.isProcessing chip then
                    LoadingIcon.view iconConfig
                else if UD.isError chip then
                    ErrorIcon.view iconConfig
                else if UD.isNotActive chip then
                    empty
                else
                    CheckIcon.view iconConfig
            ]


iconConfig : { size : Size }
iconConfig =
    { size = Normal }
