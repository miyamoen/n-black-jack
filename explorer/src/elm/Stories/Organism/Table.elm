module Stories.Organism.Table exposing (viewStories)

import Rocket exposing ((=>))
import Stories.Dummy exposing (accounts, cards)
import Stories.Element exposing (toHtmlWithSymbol)
import Types exposing (..)
import UIExplorer exposing (renderStories)
import View.Organism.Table exposing (view)


dealer : Dealer
dealer =
    { cards = [ Card Spade Ace Up, Card Spade Jack Down ] }


player : Maybe Player
player =
    Just
        { account =
            Authenticated
                { id = "5dMEzM1F71dmpAChHLhy0IGtd013"
                , chip = -4362896299872285998
                , name = Nothing
                , iconUrl = Just "https://pbs.twimg.com/profile_images/438670444409806849/Vnzne20N_normal.jpeg"
                }
        , cards = [ Card Spade Ace Up, Card Spade Jack Up ]
        , bet = Just 100
        }


stories : List ( String, Table )
stories =
    [ "Empty" => Table dealer Nothing Nothing Nothing Nothing Nothing
    , "Full" => Table dealer player player player player player
    ]


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories
