module Stories.Molecule.Cards exposing (viewStories)

import Element exposing (Element)
import Rocket exposing ((=>))
import Stories.Element exposing (toHtmlWithSymbol)
import Styles exposing (Styles, Variation)
import Types exposing (Card, Face(..), Number(..), Suit(..))
import UIExplorer exposing (renderStories)
import View.Molecule.Cards as Cards exposing (Align(..))


cards : List Card
cards =
    [ Card Spade Ace Up, Card Club Ten Up, Card Heart Four Up ]


view : Align -> Element Styles Variation msg
view align =
    Cards.view align cards


stories : List ( String, Align )
stories =
    [ "Slanting" => Slanting
    , "Horizontal" => Horizontal
    , "Vertical" => Vertical
    ]


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories
