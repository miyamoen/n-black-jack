module Stories.Atom.Chip exposing (viewStories)

import Element exposing (Element)
import Rocket exposing ((=>))
import Stories.Element exposing (toHtmlWithSymbol)
import UIExplorer exposing (renderStories)
import View.Symbol as Symbol


view : Int -> Element style variation msg
view size =
    Symbol.element size size Symbol.Chip


stories : List ( String, Int )
stories =
    [ "70" => 70
    , "90" => 90
    , "100" => 100
    , "125" => 125
    , "150" => 150
    ]


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories
