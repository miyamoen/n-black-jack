module Stories.Atom.PointLabel exposing (viewStories)

import Element exposing (Element, empty)
import Rocket exposing ((=>))
import Stories.Element exposing (toHtml)
import Styles.Types exposing (FontSize(..), Styles)
import Types exposing (Card, Face(..), Number(..), Suit(..))
import UIExplorer exposing (renderStories)
import View.Atom.PointLabel as PointLabel


view : List Card -> Element Styles variation msg
view cards =
    PointLabel.view Medium cards


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
    renderStories (view >> toHtml) stories
