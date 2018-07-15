module View.Molecule.Hands.Box exposing (Data, view)

import Element exposing (..)
import Element.Attributes exposing (..)
import PushableData exposing (PushableData(..))
import Types exposing (..)
import Types.Firebase as Firebase
import Types.Styles exposing (..)
import View.Molecule.Hands.Board as Board
import View.Molecule.Hands.Frame as Frame


type alias Data a =
    { a
        | cards : List Card
        , action : PushableData Action Firebase.Error
    }


view : Data a -> RootElement msg
view data =
    Frame.view data
        |> below
            [ when (isOpen data.action)
                (el None [ center ] <| Board.view data)
            ]


isOpen : PushableData a b -> Bool
isOpen pushable =
    case pushable of
        NotSelected ->
            True

        Pushing _ ->
            False

        PushFailure _ ->
            True

        Pushed _ ->
            False

        NotActive ->
            False
