module Stories.Molecule.Betting.Button exposing (viewStories)

import PushableData as PD exposing (PushableData)
import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtmlWithSymbol)
import UIExplorer exposing (renderStories)
import View.Molecule.Betting.Button exposing (Data, view)


stories : List ( String, Data {} )
stories =
    [ "default"
        => { price = 5
           , bettingLimit = { max = 20, min = 1 }
           , betting = PD.NotPushed { local = 5, previous = 20 }
           }
    , "Enable"
        => { price = 5
           , bettingLimit = { max = 20, min = 1 }
           , betting = PD.NotPushed { local = 15, previous = 20 }
           }
    , "Disable"
        => { price = 5
           , bettingLimit = { max = 20, min = 1 }
           , betting = PD.NotPushed { local = 17, previous = 20 }
           }
    ]


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories


main =
    fromStories viewStories
