module Stories.Molecule.Betting.ResetButton exposing (viewStories)

import PushableData as PD exposing (PushableData)
import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtml)
import UIExplorer exposing (renderStories)
import View.Molecule.Betting.ResetButton exposing (Data, view)


stories : List ( String, Data {} )
stories =
    [ "NotPushedEnable"
        => { betting =
                PD.NotPushed
                    { local = 10, previous = 20 }
           }
    , "NotPushedDisable"
        => { betting =
                PD.NotPushed
                    { local = 20, previous = 20 }
           }
    , "Previous20"
        => { betting =
                PD.Pushing
                    { local = 10, remote = 20, pushing = 10 }
           }
    ]


viewStories =
    renderStories (view >> toHtml) stories


main =
    fromStories viewStories
