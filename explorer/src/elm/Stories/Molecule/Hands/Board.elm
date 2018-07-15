module Stories.Molecule.Hands.Board exposing (viewStories)

import PushableData exposing (PushableData(..))
import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtmlWithSymbol)
import Types exposing (..)
import UIExplorer exposing (renderStories)
import View.Molecule.Hands.Board exposing (Data, view)


stories : List ( String, Data {} )
stories =
    [ "NotSelected" => { action = NotSelected }
    , "NotActive" => { action = NotActive }
    , "PushingHit" => { action = Pushing Hit }
    , "PushingStand" => { action = Pushing Stand }
    , "PushedHit" => { action = Pushed Hit }
    , "PushedStand" => { action = Pushed Stand }
    , "PushFailureHit"
        => { action =
                PushFailure
                    { failed = Hit
                    , error =
                        { code = "errorcode"
                        , message = "errormsg"
                        }
                    }
           }
    ]


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories


main =
    fromStories viewStories
