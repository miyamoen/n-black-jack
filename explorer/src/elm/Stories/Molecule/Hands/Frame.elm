module Stories.Molecule.Hands.Frame exposing (viewStories)

import PushableData exposing (PushableData(..))
import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtmlWithSymbol)
import Types exposing (..)
import Types.Firebase as Firebase
import UIExplorer exposing (renderStories)
import View.Molecule.Hands.Frame exposing (Data, view)


data : PushableData Action Firebase.Error -> Data {}
data action =
    { action = action, cards = [ Card Spade Two Up, Card Spade Five Up ] }


stories : List ( String, Data {} )
stories =
    [ "NotSelected" => data NotSelected
    , "NotActive" => data NotActive
    , "PushingHit" => data (Pushing Hit)
    , "PushingStand" => data (Pushing Stand)
    , "PushedHit" => data (Pushed Hit)
    , "PushedStand" => data (Pushed Stand)
    , "PushFailureHit"
        => data
            (PushFailure
                { failed = Hit
                , error =
                    { code = "errorcode"
                    , message = "errormsg"
                    }
                }
            )
    ]


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories


main =
    fromStories viewStories
