module Stories.Molecule.Bet.Chips exposing (viewStories)

import PushableData as PD exposing (PushableData)
import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtmlWithSymbol)
import UIExplorer exposing (renderStories)
import View.Molecule.Bet.Chips exposing (Data, view)


stories : List ( String, Data {} )
stories =
    [ "max1"
        => { limit = { max = 1, min = 1 }
           , chip = PD.NotPushed { local = 1, previous = 20 }
           }
    , "max4"
        => { limit = { max = 4, min = 1 }
           , chip = PD.NotPushed { local = 1, previous = 20 }
           }
    , "max5"
        => { limit = { max = 5, min = 1 }
           , chip = PD.NotPushed { local = 1, previous = 20 }
           }
    , "max24"
        => { limit = { max = 24, min = 1 }
           , chip = PD.NotPushed { local = 1, previous = 20 }
           }
    , "max25"
        => { limit = { max = 25, min = 1 }
           , chip = PD.NotPushed { local = 1, previous = 20 }
           }
    , "max99"
        => { limit = { max = 99, min = 1 }
           , chip = PD.NotPushed { local = 1, previous = 20 }
           }
    , "max100"
        => { limit = { max = 100, min = 1 }
           , chip = PD.NotPushed { local = 1, previous = 20 }
           }
    , "max499"
        => { limit = { max = 499, min = 1 }
           , chip = PD.NotPushed { local = 17, previous = 20 }
           }
    , "max500"
        => { limit = { max = 500, min = 1 }
           , chip = PD.NotPushed { local = 17, previous = 20 }
           }
    , "max999"
        => { limit = { max = 999, min = 1 }
           , chip = PD.NotPushed { local = 17, previous = 20 }
           }
    , "max1000"
        => { limit = { max = 1000, min = 1 }
           , chip = PD.NotPushed { local = 17, previous = 20 }
           }
    ]


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories


main =
    fromStories viewStories
