module View.Organism.Betting exposing (Data, view)

import Element exposing (..)
import Element.Attributes exposing (..)
import PushableData as PD exposing (PushableData)
import Types exposing (Limit)
import Types.Firebase as Firebase
import Types.Styles exposing (..)
import View.Molecule.Betting.Buttons as ChipButtons
import View.Molecule.Betting.CancelButton as Cancel
import View.Molecule.Betting.CheckButton as Check
import View.Molecule.Betting.ResetButton as Reset


type alias Data a =
    { a
        | bettingLimit : Limit
        , betting : PushableData Int Firebase.Error
    }


view : Data a -> RootElement msg
view data =
    row None
        []
        [ column None
            [ alignLeft ]
            [ Reset.view data
            , ChipButtons.view data
            ]
        , column None
            [ alignRight ]
            [ Cancel.view
            , Check.view data
            ]
        ]
