module Stories.Molecule.Text.Point exposing (viewStories)

import Color.Pallet exposing (..)
import Rocket exposing ((=>))
import Stories.Utils exposing (toHtml, fromStories)
import Types exposing (Card, Face(..), Number(..), Suit(..))
import Types.Styles.Text exposing (..)
import UIExplorer exposing (renderStories)
import View.Atom.Text exposing (Config)
import View.Molecule.Text.Point as Point


config : Config {}
config =
    { style = BoldItaric
    , size = Medium
    , line = OneLine
    , align = Center
    , pallet = Pallet Orange Lighten1
    , onTable = True
    }


stories : List ( String, List Card )
stories =
    [ "Empty" => []
    , "BlackJack" => [ Card Spade Ace Up, Card Spade Ten Up ]
    , "TwentyOne"
        => [ Card Spade Ace Up
           , Card Spade Ten Up
           , Card Spade King Up
           ]
    , "FaceDown"
        => [ Card Spade Ten Down
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
    ]


viewStories =
    renderStories (Point.view config >> toHtml) stories


main =
    fromStories viewStories
