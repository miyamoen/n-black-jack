module Stories.Molecule.Bet.Circle exposing (viewStories)

import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtmlWithSymbol)
import UIExplorer exposing (renderStories)
import View.Molecule.Bet.Circle exposing (view)


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


main =
    fromStories viewStories
