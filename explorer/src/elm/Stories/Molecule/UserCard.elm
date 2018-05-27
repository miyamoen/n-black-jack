module Stories.Molecule.UserCard exposing (viewStories)

import Rocket exposing ((=>))
import Stories.Element exposing (toHtml)
import Types exposing (User(..))
import UIExplorer exposing (renderStories)
import View.Molecule.UserCard exposing (view)


stories : List ( String, User )
stories =
    [ "Unauthenticated" => Unauthenticated
    , "me"
        => Authenticated
            { id = "5dMEzM1F71dmpAChHLhy0IGtd013"
            , name = Just "この人生は刺繍をするには短すぎる"
            , iconUrl = Just "https://pbs.twimg.com/profile_images/438670444409806849/Vnzne20N_normal.jpeg"
            }
    , "Anonymous" => Anonymous { id = "5dMEzM1F71dmpAChHLhy0IGtd013" }
    ]


viewStories =
    renderStories (view >> toHtml) stories
