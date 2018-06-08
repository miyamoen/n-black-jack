module Stories.Molecule.ChipBox exposing (viewStories)

import Rocket exposing ((=>))
import Stories.Element exposing (toHtmlWithSymbol)
import UIExplorer exposing (renderStories)
import View.Molecule.ChipBox exposing (view)


stories : List ( String, Maybe Int )
stories =
    [ "Nothing" => Nothing
    , "1" => Just 1
    , "5" => Just 5
    , "25" => Just 25
    , "100" => Just 100
    , "500" => Just 500
    , "1000" => Just 1000
    , "9999" => Just 9999
    , "BugChip" => Just -1
    ]


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories
