module Stories.Molecule.Betting.Buttons exposing (viewStories)

import PushableData as PD exposing (PushableData)
import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtmlWithSymbol)
import UIExplorer exposing (renderStories)
import View.Molecule.Betting.Buttons exposing (Data, view)


stories : List ( String, Data {} )
stories =
    [ "max1"
        => { bettingLimit = { max = 1, min = 1 }
           , betting = PD.NotPushed { local = 1, previous = 20 }
           }
    , "max4"
        => { bettingLimit = { max = 4, min = 1 }
           , betting = PD.NotPushed { local = 1, previous = 20 }
           }
    , "max5"
        => { bettingLimit = { max = 5, min = 1 }
           , betting = PD.NotPushed { local = 1, previous = 20 }
           }
    , "max24"
        => { bettingLimit = { max = 24, min = 1 }
           , betting = PD.NotPushed { local = 1, previous = 20 }
           }
    , "max25"
        => { bettingLimit = { max = 25, min = 1 }
           , betting = PD.NotPushed { local = 1, previous = 20 }
           }
    , "max99"
        => { bettingLimit = { max = 99, min = 1 }
           , betting = PD.NotPushed { local = 1, previous = 20 }
           }
    , "max100"
        => { bettingLimit = { max = 100, min = 1 }
           , betting = PD.NotPushed { local = 1, previous = 20 }
           }
    , "max499"
        => { bettingLimit = { max = 499, min = 1 }
           , betting = PD.NotPushed { local = 17, previous = 20 }
           }
    , "max500"
        => { bettingLimit = { max = 500, min = 1 }
           , betting = PD.NotPushed { local = 17, previous = 20 }
           }
    , "max999"
        => { bettingLimit = { max = 999, min = 1 }
           , betting = PD.NotPushed { local = 17, previous = 20 }
           }
    , "max1000"
        => { bettingLimit = { max = 1000, min = 1 }
           , betting = PD.NotPushed { local = 17, previous = 20 }
           }
    ]


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories


main =
    fromStories viewStories
