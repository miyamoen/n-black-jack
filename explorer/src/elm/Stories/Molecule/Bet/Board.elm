module Stories.Molecule.Bet.Board exposing (viewStories)

import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtmlWithSymbol)
import UIExplorer exposing (renderStories)
import UpdatableData as UD exposing (UpdatableData)
import View.Molecule.Bet.Board exposing (Data, view)


stories : List ( String, Data {} )
stories =
    [ "Updatable"
        => { limit = { max = 1, min = 1 }
           , chip = UD.NotPushed { local = 1, previous = 20 }
           }
    , "NotUpdatable"
        => { limit = { max = 4, min = 1 }
           , chip = UD.Updating { local = 5, remote = 20, pushing = 5 }
           }
    ]


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories


main =
    fromStories viewStories
