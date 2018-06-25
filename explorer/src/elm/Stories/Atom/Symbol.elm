module Stories.Atom.Symbol exposing (viewStories)

import Element exposing (Element)
import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtmlWithSymbol)
import UIExplorer exposing (renderStories)
import View.Symbol as Symbol exposing (Symbol(..))


type alias Config number =
    { width : number, height : number, symbol : Symbol }


view : Config number -> Element style variation msg
view { width, height, symbol } =
    Symbol.element width height symbol


stories : List ( String, Config number )
stories =
    [ "Chip" => Config 100 100 Chip
    , "SimpleChip" => Config 100 100 SimpleChip
    ]


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories


main =
    fromStories viewStories
