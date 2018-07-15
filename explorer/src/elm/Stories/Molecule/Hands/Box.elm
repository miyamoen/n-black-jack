module Stories.Molecule.Hands.Box exposing (viewStories)

import PushableData as PD exposing (PushableData(..))
import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtmlWithSymbol)
import Types exposing (..)
import UIExplorer exposing (renderStories)
import View.Molecule.Hands.Box exposing (Data, view)


cards : List Card
cards =
    [ Card Spade Two Up, Card Spade Five Up ]


stories : List ( String, Data {} )
stories =
    [ "NotSelected" => { cards = cards, action = NotSelected }
    , "NotActive" => { cards = cards, action = NotActive }
    , "PushingHit" => { cards = cards, action = Pushing Hit }
    , "PushingStand" => { cards = cards, action = Pushing Stand }
    , "PushedHit" => { cards = cards, action = Pushed Hit }
    , "PushedStand" => { cards = cards, action = Pushed Stand }
    , "PushFailureHit"
        => { cards = cards
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
