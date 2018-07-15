module View.Molecule.Base.Player exposing (Data, view)

import Element exposing (..)
import Element.Attributes exposing (..)
import PushableData as PD exposing (PushableData)
import Types exposing (..)
import Types.Card exposing (..)
import Types.Firebase as Firebase
import Types.Styles exposing (..)
import Types.Styles.PlayBoard exposing (State(..))
import UpdatableData as UD exposing (UpdatableData)
import View.Molecule.Avatar.WithLabel as Avatar
import View.Molecule.Bet.Box as BetBox
import View.Molecule.Hands.Box as HandsBox


type alias Data a =
    Maybe
        { a
            | account : Account
            , limit : Limit
            , chip : UpdatableData Int Firebase.Error
            , cards : List Card
            , action : PushableData Action Firebase.Error
        }


view : State -> Data a -> RootElement msg
view betBoxState maybe =
    column None
        [ spacing 10
        , center
        ]
        [ Maybe.map HandsBox.view maybe
            |> Maybe.withDefault
                (HandsBox.view handsEmpty)
        , Maybe.map (BetBox.view betBoxState) maybe
            |> Maybe.withDefault
                (BetBox.view betBoxState betEmpty)
        , Maybe.map (.account >> Avatar.view) maybe
            |> Maybe.withDefault empty
        ]


handsEmpty : HandsBox.Data {}
handsEmpty =
    { cards = []
    , action = PD.NotActive
    }


betEmpty : BetBox.Data {}
betEmpty =
    { limit = { min = 0, max = 0 }
    , chip = UD.Previous 0
    }
