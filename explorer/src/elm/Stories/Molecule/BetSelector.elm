module Stories.Molecule.BetSelector exposing (viewStories)

import Element exposing (Element)
import Rocket exposing ((=>))
import Stories.Element exposing (toHtmlWithSymbol)
import Styles.Types exposing (Styles, Variation)
import UIExplorer exposing (renderStories)
import View.Molecule.BetSelector as BetSelector exposing (Show)
import View.Molecule.ChipBox as ChipBox


view : Show a b -> Element Styles Variation msg
view story =
    ChipBox.view story.me.bet
        |> BetSelector.view story


stories : List ( String, Show {} {} )
stories =
    [ "History0"
        => { betLimit = { min = 30, max = 100 }
           , me =
                { betHistory = [ 30, 30, 40, 120, 90, 100, 35 ]
                , bet = Nothing
                }
           }
    ]


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories
