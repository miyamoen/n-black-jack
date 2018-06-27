module Stories.Organism.Table.DealingBox exposing (viewStories)

import Stories.Dummy as Dummy
import Stories.Utils exposing (fromStories, toHtmlWithSymbol)
import Types exposing (Card, Face(..), Number(..), Suit(..))
import UIExplorer exposing (renderStories)
import View.Organism.Table.DealingBox exposing (view)


stories : List ( String, List Card )
stories =
    Dummy.cards


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories


main =
    fromStories viewStories
