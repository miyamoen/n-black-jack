module Stories.Organism.Bases exposing (viewStories)

import Rocket exposing ((=>))
import Stories.Element exposing (toHtmlWithSymbol)
import Types exposing (..)
import UIExplorer exposing (renderStories)
import View.Organism.Bases exposing (view)


dealer : Dealer
dealer =
    { cards = [ Card Spade Ace Down, Card Spade Jack Up ] }


noName : Maybe Seating
noName =
    Just <|
        Other
            { account =
                Authenticated
                    { id = "5dMEzM1F71dmpAChHLhy0IGtd013"
                    , chip = 2896299872285998
                    , name = Nothing
                    , iconUrl = Nothing
                    }
            , cards = [ Card Spade Ace Up, Card Spade Jack Up ]
            , bet = Just 150
            }


anonymous : Maybe Seating
anonymous =
    Just <|
        Other
            { account =
                Anonymous { id = "5dMEzM1F71dmpAChHLhy0IGtd013", chip = 100 }
            , cards = [ Card Spade Ace Up, Card Spade Jack Up ]
            , bet = Just 20
            }


me : Player
me =
    { account =
        Authenticated
            { id = "5dMEzM1F71dmpAChHLhy0IGtd013"
            , chip = 1000
            , name = Just "この人生は刺繍をするには短すぎる"
            , iconUrl = Just "https://pbs.twimg.com/profile_images/438670444409806849/Vnzne20N_normal.jpeg"
            }
    , cards = [ Card Spade Ace Up, Card Spade Jack Up ]
    , bet = Just 100
    }


stories : List ( String, Table )
stories =
    [ "Empty"
        => { id = "hogehoge"
           , betLimit = { min = 5, max = 100 }
           , dealer = dealer
           , me = me
           , phase = WaitingBet
           , bases =
                FiveBases
                    { first = Nothing
                    , second = Nothing
                    , third = Nothing
                    , fourth = Nothing
                    , fifth = Nothing
                    }
           }
    , "Full"
        => { id = "fogofogo"
           , betLimit = { min = 5, max = 100 }
           , dealer = dealer
           , me = me
           , phase = PlayerAction
           , bases =
                FiveBases
                    { first = noName
                    , second = noName
                    , third = anonymous
                    , fourth = Just Me
                    , fifth = anonymous
                    }
           }
    ]


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories
