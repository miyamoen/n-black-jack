module Stories.Atom.SimpleChipSvg exposing (viewStories)

import Element exposing (Element)
import Rocket exposing ((=>))
import Stories.Element exposing (toHtmlWithSymbol)
import UIExplorer exposing (renderStories)
import View.Symbol as Symbol


view : Int -> Element style variation msg
view size =
    Symbol.element size size Symbol.SimpleChip


stories : List ( String, Int )
stories =
    [ "60" => 60
    , "80" => 80
    , "100" => 100
    , "120" => 120
    ]


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories
