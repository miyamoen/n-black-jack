module Stories.Molecule.Hands.Selector exposing (viewStories)

import PushableData exposing (PushableData(..))
import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtmlWithSymbol)
import Types exposing (..)
import UIExplorer exposing (renderStories)
import View.Molecule.Hands.Selector exposing (Data, view)


stories : List ( String, Data {} )
stories =
    [ "NotSelected" => { target = Hit, action = NotSelected }
    , "NotActive" => { target = Stand, action = NotActive }
    , "PushingHit" => { target = Hit, action = Pushing Hit }
    , "PushingStand" => { target = Hit, action = Pushing Stand }
    , "PushedHit" => { target = Hit, action = Pushed Hit }
    , "PushedStand" => { target = Hit, action = Pushed Stand }
    , "PushFailureHit"
        => { target = Hit
           , action =
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
