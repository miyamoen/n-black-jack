module Stories.Molecule.Bet.Box exposing (viewStories)

import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtmlWithSymbol)
import Types.Styles.PlayBoard exposing (State(..))
import UIExplorer exposing (renderStories)
import UpdatableData as UD exposing (UpdatableData)
import View.Molecule.Bet.Box exposing (Data, view)


stories : List ( String, ( State, Data {} ) )
stories =
    [ "NotPushedOpen"
        => ( Open
           , { chip = UD.NotPushed { local = 1, previous = 20 }
             , limit = { max = 20, min = 1 }
             }
           )
    , "NotPushedClose"
        => ( Close
           , { chip = UD.NotPushed { local = 1, previous = 20 }
             , limit = { max = 20, min = 1 }
             }
           )
    , "Pushed"
        => ( Close
           , { chip = UD.Pushed { local = 1, remote = 20 }
             , limit = { max = 20, min = 1 }
             }
           )
    , "UpdatingOpen"
        => ( Open
           , { chip = UD.Updating { local = 5, remote = 20, pushing = 10 }
             , limit = { max = 20, min = 1 }
             }
           )
    , "UpdatingClose"
        => ( Close
           , { chip = UD.Updating { local = 5, remote = 20, pushing = 10 }
             , limit = { max = 20, min = 1 }
             }
           )
    , "DeletingClose"
        => ( Close
           , { chip = UD.Deleting { local = 5, remote = 20 }
             , limit = { max = 20, min = 1 }
             }
           )
    , "UpdateFailure"
        => ( Close
           , { chip =
                UD.UpdateFailure
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
                UD.DeleteFailure
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
