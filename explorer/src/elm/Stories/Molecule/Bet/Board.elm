module Stories.Molecule.Bet.Board exposing (viewStories)

import PushableData as PD exposing (PushableData)
import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtmlWithSymbol)
import UIExplorer exposing (renderStories)
import View.Molecule.Bet.Board exposing (Data, view)


stories : List ( String, Data {} )
stories =
    [ "Pushable"
        => { limit = { max = 1, min = 1 }
           , chip = PD.NotPushed { local = 1, previous = 20 }
           }
    , "NotPushable"
        => { limit = { max = 4, min = 1 }
           , chip = PD.Pushing { local = 5, remote = 20, pushing = 5 }
           }
    ]


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories


main =
    fromStories viewStories
