module Stories.Molecule.Avatar exposing (viewStories)

import Rocket exposing ((=>))
import Stories.Utils exposing (toHtml, fromStories)
import Types exposing (Account(..))
import UIExplorer exposing (renderStories)
import View.Molecule.Avatar exposing (view)


stories : List ( String, Account )
stories =
    [ "Unauthenticated" => Unauthenticated
    , "me"
        => Authenticated
            { id = "5dMEzM1F71dmpAChHLhy0IGtd013"
            , chip = 1000
            , name = Just "この人生は刺繍をするには短すぎる"
            , iconUrl = Just "https://pbs.twimg.com/profile_images/438670444409806849/Vnzne20N_normal.jpeg"
            }
    , "Anonymous"
        => Anonymous
            { id = "5dMEzM1F71dmpAChHLhy0IGtd013"
            , chip = 0
            }
    ]


viewStories =
    renderStories (view >> toHtml) stories


main =
    fromStories viewStories
