module Stories.Molecule.CardBox exposing (viewStories)

import Stories.Dummy as Dummy
import Stories.Element exposing (toHtmlWithSymbol)
import Types exposing (Card, Face(..), Number(..), Suit(..))
import UIExplorer exposing (renderStories)
import View.Molecule.CardBox exposing (view)


cards : List Card
cards =
    [ Card Spade Ace Up, Card Club Ten Up, Card Heart Four Up ]


stories : List ( String, List Card )
stories =
    Dummy.cards


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories
