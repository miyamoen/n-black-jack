module Stories.Molecule.Bet.Box exposing (viewStories)

import PushableData as PD exposing (PushableData)
import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtmlWithSymbol)
import Types.Styles.Bet exposing (State(..))
import UIExplorer exposing (renderStories)
import View.Molecule.Bet.Box exposing (Data, view)


stories : List ( String, ( State, Data {} ) )
stories =
    [ "NotPushedOpen"
        => ( Open
           , { chip = PD.NotPushed { local = 1, previous = 20 }
             , limit = { max = 20, min = 1 }
             }
           )
    , "NotPushedClose"
        => ( Close
           , { chip = PD.NotPushed { local = 1, previous = 20 }
             , limit = { max = 20, min = 1 }
             }
           )
    , "Pushed"
        => ( Close
           , { chip = PD.Pushed { local = 1, remote = 20 }
             , limit = { max = 20, min = 1 }
             }
           )
    , "PushingOpen"
        => ( Open
           , { chip = PD.Pushing { local = 5, remote = 20, pushing = 10 }
             , limit = { max = 20, min = 1 }
             }
           )
    , "PushingClose"
        => ( Close
           , { chip = PD.Pushing { local = 5, remote = 20, pushing = 10 }
             , limit = { max = 20, min = 1 }
             }
           )
    , "DeletingClose"
        => ( Close
           , { chip = PD.Deleting { local = 5, remote = 20 }
             , limit = { max = 20, min = 1 }
             }
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
             , limit = { max = 20, min = 1 }
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
             , limit = { max = 20, min = 1 }
             }
           )
    ]


viewStories =
    renderStories (uncurry view >> toHtmlWithSymbol) stories


main =
    fromStories viewStories
