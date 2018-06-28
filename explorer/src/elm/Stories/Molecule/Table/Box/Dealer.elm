module Stories.Molecule.Table.Box.Dealer exposing (viewStories)

import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtmlWithSymbol)
import Types exposing (Card, Dealer, Face(..), Number(..), Suit(..))
import UIExplorer exposing (renderStories)
import View.Molecule.Table.Box.Dealer exposing (view)


stories : List ( String, Dealer )
stories =
    [ "Empty" => { cards = [] }
    , "One" => { cards = [ Card Spade Ace Up ] }
    , "FaceDown"
        => { cards =
                [ Card Spade Ten Down
                , Card Spade King Up
                ]
           }
    , "BlackJack" => { cards = [ Card Spade Ace Up, Card Spade Ten Up ] }
    , "TwentyOne"
        => { cards =
                [ Card Spade Ace Up
                , Card Spade Ten Up
                , Card Spade King Up
                ]
           }
    , "Point19"
        => { cards =
                [ Card Spade Jack Up
                , Card Spade Three Up
                , Card Spade Six Up
                ]
           }
    , "PointAce"
        => { cards =
                [ Card Spade Ace Up
                , Card Spade Three Up
                , Card Spade Six Up
                ]
           }
    , "PointAce2"
        => { cards =
                [ Card Spade Ace Up
                , Card Spade Seven Up
                , Card Spade Six Up
                ]
           }
    , "AceTwentyOne"
        => { cards =
                [ Card Spade Ace Up
                , Card Spade Four Up
                , Card Spade Six Up
                ]
           }
    , "Bust"
        => { cards =
                [ Card Spade Nine Up
                , Card Spade Four Up
                , Card Spade Six Up
                , Card Spade Eight Up
                ]
           }
    , "Five"
        => { cards =
                [ Card Spade Ace Up
                , Card Heart Ace Up
                , Card Spade Four Up
                , Card Diamond Six Up
                , Card Spade Six Up
                ]
           }
    , "Six"
        => { cards =
                [ Card Spade Ace Up
                , Card Heart Ace Up
                , Card Club Ace Up
                , Card Spade Four Up
                , Card Diamond Six Up
                , Card Spade Six Up
                ]
           }
    , "Seven"
        => { cards =
                [ Card Spade Ace Up
                , Card Heart Ace Up
                , Card Club Ace Up
                , Card Diamond Ace Up
                , Card Spade Four Up
                , Card Diamond Six Up
                , Card Spade Six Up
                ]
           }
    ]


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories


main =
    fromStories viewStories
