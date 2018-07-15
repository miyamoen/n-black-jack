module Stories.Molecule.Cards.Dealer exposing (viewStories)

import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtmlWithSymbol)
import Types.Card exposing (Card, Face(..), Number(..), Suit(..))
import UIExplorer exposing (renderStories)
import View.Molecule.Cards.Dealer exposing (view)


cards : List Card
cards =
    [ Card Spade Ace Up, Card Club Ten Up, Card Heart Four Up ]


stories : List ( String, List Card )
stories =
    [ "Empty" => []
    , "One" => [ Card Spade Ace Up ]
    , "BlackJack" => [ Card Spade Ten Up, Card Spade Ace Up ]
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


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories


main =
    fromStories viewStories
