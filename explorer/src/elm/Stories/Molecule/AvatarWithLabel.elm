module Stories.Molecule.AvatarWithLabel exposing (viewStories)

import Rocket exposing ((=>))
import Stories.Element exposing (toHtmlWithSymbol)
import Types exposing (Account(..))
import UIExplorer exposing (renderStories)
import View.Molecule.AvatarWithLabel exposing (view)


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
    renderStories (view >> toHtmlWithSymbol) stories
