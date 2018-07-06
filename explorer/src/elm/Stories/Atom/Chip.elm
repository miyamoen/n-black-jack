module Stories.Atom.Chip exposing (viewStories)

import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtmlWithSymbol)
import UIExplorer exposing (renderStories)
import View.Atom.Chip exposing (view)


stories : List ( String, Int )
stories =
    [ "1" => 1
    , "5" => 5
    , "25" => 25
    , "100" => 100
    , "500" => 500
    , "1000" => 1000
    , "9999" => 9999
    , "BugChip" => -1
    ]


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories


main =
    fromStories viewStories
