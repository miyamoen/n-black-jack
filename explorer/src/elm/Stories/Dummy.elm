module Stories.Dummy exposing (..)

import Rocket exposing ((=>))
import Types exposing (..)


accounts : List ( String, Account )
accounts =
    [ "Unauthenticated" => Unauthenticated
    , "Anonymous"
        => Anonymous
            { id = "5dMEzM1F71dmpAChHLhy0IGtd013"
            , chip = 1000
            }
    , "Authenticated"
        => Authenticated
            { id = "5dMEzM1F71dmpAChHLhy0IGtd013"
            , chip = 100
            , name = Just "miyamoen"
            , iconUrl = Just "https://pbs.twimg.com/profile_images/438670444409806849/Vnzne20N_normal.jpeg"
            }
    , "WithoutIcon"
        => Authenticated
            { id = "5dMEzM1F71dmpAChHLhy0IGtd013"
            , chip = 1234567890
            , name = Just "この人生は刺繍をするには短すぎる"
            , iconUrl = Nothing
            }
    , "WithoutName"
        => Authenticated
            { id = "5dMEzM1F71dmpAChHLhy0IGtd013"
            , chip = -4362896299872285998
            , name = Nothing
            , iconUrl = Just "https://pbs.twimg.com/profile_images/438670444409806849/Vnzne20N_normal.jpeg"
            }
    ]


cards : List ( String, List Card )
cards =
    [ "Empty" => []
    , "BlackJack" => [ Card Spade Ace Up, Card Spade Ten Up ]
    , "TwentyOne"
        => [ Card Spade Ace Up
           , Card Spade Ten Up
           , Card Spade King Up
           ]
    , "Point19"
        => [ Card Spade Jack Up
           , Card Spade Three Up
           , Card Spade Six Up
           ]
    , "PointAce"
        => [ Card Spade Ace Up
           , Card Spade Three Up
           , Card Spade Six Up
           ]
    , "PointAce2"
        => [ Card Spade Ace Up
           , Card Spade Seven Up
           , Card Spade Six Up
           ]
    , "AceTwentyOne"
        => [ Card Spade Ace Up
           , Card Spade Four Up
           , Card Spade Six Up
           ]
    , "Bust"
        => [ Card Spade Nine Up
           , Card Spade Four Up
           , Card Spade Six Up
           , Card Spade Eight Up
           ]
    , "Five"
        => [ Card Spade Ace Up
           , Card Heart Ace Up
           , Card Spade Four Up
           , Card Diamond Six Up
           , Card Spade Six Up
           ]
    , "Six"
        => [ Card Spade Ace Up
           , Card Heart Ace Up
           , Card Club Ace Up
           , Card Spade Four Up
           , Card Diamond Six Up
           , Card Spade Six Up
           ]
    , "Seven"
        => [ Card Spade Ace Up
           , Card Heart Ace Up
           , Card Club Ace Up
           , Card Diamond Ace Up
           , Card Spade Four Up
           , Card Diamond Six Up
           , Card Spade Six Up
           ]
    ]
