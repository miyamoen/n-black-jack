module Stories.Organism.BetSelector exposing (viewStories)

import Rocket exposing ((=>))
import Stories.Element exposing (toHtmlWithSymbol)
import UIExplorer exposing (renderStories)
import View.Organism.BetSelector as BetSelector exposing (Show, view)


stories : List ( String, Show {} {} )
stories =
    [ "History0"
        => { betLimit = { min = 30, max = 100 }
           , me =
                { betHistory = []
                , bet = Nothing
                }
           }
    , "History"
        => { betLimit = { min = 30, max = 100 }
           , me =
                { betHistory = [ 30, 30, 40, 120, 90, 100, 35 ]
                , bet = Nothing
                }
           }
    , "now70max100"
        => { betLimit = { min = 30, max = 100 }
           , me =
                { betHistory = [ 30, 30, 40, 120, 90, 100, 35 ]
                , bet = Just 70
                }
           }
    ]


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories
