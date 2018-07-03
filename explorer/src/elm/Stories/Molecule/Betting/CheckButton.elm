module Stories.Molecule.Betting.CheckButton exposing (viewStories)

import PushableData as PD exposing (PushableData)
import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtmlWithSymbol)
import UIExplorer exposing (renderStories)
import View.Molecule.Betting.CheckButton exposing (Data, view)


stories : List ( String, Data {} )
stories =
    [ "NotPushed"
        => { betting =
                PD.NotPushed
                    { local = 10, previous = 20 }
           }
    , "SameNotPushed"
        => { betting =
                PD.NotPushed
                    { local = 20, previous = 20 }
           }
    , "Disable"
        => { betting =
                PD.Pushing
                    { local = 10, remote = 20, pushing = 10 }
           }
    ]


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories


main =
    fromStories viewStories
