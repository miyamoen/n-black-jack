module Stories.Molecule.Base.Player exposing (viewStories)

import PushableData as PD exposing (PushableData)
import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtmlWithSymbol)
import Types exposing (..)
import Types.Styles.PlayBoard exposing (State(..))
import UIExplorer exposing (renderStories)
import UpdatableData as UD exposing (UpdatableData)
import View.Molecule.Base.Player exposing (Data, view)


account : Account
account =
    Authenticated
        { id = "5dMEzM1F71dmpAChHLhy0IGtd013"
        , chip = 1000070
        , name = Just "Miyamo"
        , iconUrl = Just "https://pbs.twimg.com/profile_images/438670444409806849/Vnzne20N_normal.jpeg"
        }


stories : List ( String, ( State, Data {} ) )
stories =
    [ "NoPlayer" => ( Close, Nothing )
    , "Player"
        => ( Close
           , Just
                { account = account
                , cards = [ Card Spade Ace Up, Card Heart Six Up ]
                , limit = { min = 1, max = 25 }
                , chip = UD.Pushed { local = 10, remote = 10 }
                , action = PD.Pushing Stand
                }
           )
    , "PlayerActionOpen"
        => ( Close
           , Just
                { account = account
                , cards = [ Card Spade Ace Up, Card Heart Six Up ]
                , limit = { min = 1, max = 25 }
                , chip = UD.Pushed { local = 10, remote = 10 }
                , action = PD.NotSelected
                }
           )
    , "PlayerBetOpen"
        => ( Open
           , Just
                { account = account
                , cards = [ Card Spade Ace Up, Card Heart Six Up ]
                , limit = { min = 1, max = 25 }
                , chip = UD.Pushed { local = 20, remote = 10 }
                , action = PD.NotActive
                }
           )
    ]


viewStories =
    renderStories (uncurry view >> toHtmlWithSymbol) stories


main =
    fromStories viewStories
