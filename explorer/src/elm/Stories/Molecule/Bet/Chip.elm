module Stories.Molecule.Bet.Chip exposing (viewStories)

import PushableData as PD exposing (PushableData)
import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtmlWithSymbol)
import UIExplorer exposing (renderStories)
import View.Molecule.Bet.Chip exposing (Data, view)


stories : List ( String, Data {} )
stories =
    [ "default"
        => { price = 5
           , limit = { max = 20, min = 1 }
           , chip = PD.NotPushed { local = 5, previous = 20 }
           }
    , "Enable"
        => { price = 5
           , limit = { max = 20, min = 1 }
           , chip = PD.NotPushed { local = 15, previous = 20 }
           }
    , "Disable"
        => { price = 5
           , limit = { max = 20, min = 1 }
           , chip = PD.NotPushed { local = 17, previous = 20 }
           }
    ]


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories


main =
    fromStories viewStories
