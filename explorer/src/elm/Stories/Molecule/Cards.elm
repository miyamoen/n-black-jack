module Stories.Molecule.Cards exposing (viewStories)

import Element exposing (Element)
import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtmlWithSymbol)
import Types exposing (Card, Face(..), Number(..), Suit(..))
import Types.Styles exposing (Styles, Variation)
import Types.Styles.Cards exposing (Align(..))
import UIExplorer exposing (renderStories)
import View.Molecule.Cards as Cards exposing (Config)


cards : List Card
cards =
    [ Card Spade Ace Up, Card Club Ten Up, Card Heart Four Up ]


view : Config a -> Element Styles Variation msg
view config =
    Cards.view config cards


stories : List ( String, Config {} )
stories =
    [ "Slanting" => { align = Slanting }
    , "Horizontal" => { align = Horizontal }
    , "Vertical" => { align = Vertical }
    , "Folding" => { align = Folding }
    ]


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories


main =
    fromStories viewStories
