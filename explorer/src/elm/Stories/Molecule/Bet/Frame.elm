module Stories.Molecule.Bet.Frame exposing (viewStories)

import PushableData as PD exposing (PushableData)
import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtmlWithSymbol)
import Types.Styles.Bet exposing (State(..))
import UIExplorer exposing (renderStories)
import View.Molecule.Bet.Frame exposing (Data, view)


stories : List ( String, ( State, Data {} ) )
stories =
    [ "NotPushedOpen"
        => ( Open
           , { chip = PD.NotPushed { local = 1, previous = 20 } }
           )
    , "NotPushedClose"
        => ( Close
           , { chip = PD.NotPushed { local = 1, previous = 20 } }
           )
    , "Pushed"
        => ( Close
           , { chip = PD.Pushed { local = 1, remote = 20 } }
           )
    , "PushingOpen"
        => ( Open
           , { chip = PD.Pushing { local = 5, remote = 20, pushing = 10 } }
           )
    , "PushingClose"
        => ( Close
           , { chip = PD.Pushing { local = 5, remote = 20, pushing = 10 } }
           )
    , "DeletingClose"
        => ( Close
           , { chip = PD.Deleting { local = 5, remote = 20 } }
           )
    , "Failure"
        => ( Close
           , { chip =
                PD.Failure
                    { local = 5
                    , remote = 20
                    , failed = 10
                    , error = { code = "hoge", message = "huga" }
                    }
             }
           )
    , "DeleteFailure"
        => ( Close
           , { chip =
                PD.DeleteFailure
                    { local = 5
                    , remote = 20
                    , error = { code = "hoge", message = "huga" }
                    }
             }
           )
    ]


viewStories =
    renderStories (uncurry view >> toHtmlWithSymbol) stories


main =
    fromStories viewStories
