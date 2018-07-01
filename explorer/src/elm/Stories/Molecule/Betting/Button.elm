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
           , betting = PD.NotPushed 5
           }
    , "Enable"
        => { price = 5
           , bettingLimit = { max = 20, min = 1 }
           , betting = PD.NotPushed 15
           }
    , "Disable"
        => { price = 5
           , bettingLimit = { max = 20, min = 1 }
           , betting = PD.NotPushed 17
           }
    ]


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories


main =
    fromStories viewStories
