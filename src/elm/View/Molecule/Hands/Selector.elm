module View.Molecule.Hands.Selector exposing (Data, view)

import Color.Pallet exposing (..)
import Element.Attributes exposing (..)
import PushableData exposing (PushableData(..))
import Types exposing (Action(..))
import Types.Firebase as Firebase
import Types.Styles exposing (..)
import Types.Styles.Selector exposing (State(..))
import Types.Styles.Text exposing (..)
import View.Atom.Selector as Selector


type alias Data a =
    { a
        | action : PushableData Action Firebase.Error
        , target : Action
    }


view : Data a -> RootElement msg
view { action, target } =
    Selector.view
        { hue =
            case target of
                Hit ->
                    Blue

                Stand ->
                    Red
        , size = Normal
        , boxSize = px 100
        }
        (state target action)
        (toString target)


state : Action -> PushableData Action a -> State
state target pushable =
    case pushable of
        NotSelected ->
            Enable

        Pushing action ->
            if action == target then
                Selected
            else
                Disable

        PushFailure { failed } ->
            if failed == target then
                Selected
            else
                Disable

        Pushed action ->
            if action == target then
                Confirmed
            else
                Disable

        NotActive ->
            Disable
