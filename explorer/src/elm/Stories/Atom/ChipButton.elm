module Stories.Atom.ChipButton exposing (viewStories)

import Rocket exposing ((=>))
import Stories.Element exposing (toHtmlWithSymbol)
import Styles.Types exposing (..)
import UIExplorer exposing (renderStories)
import View.Atom.ChipButton exposing (Option, view)


stories : List ( String, ( Option, Int ) )
stories =
    [ "active1" => ( { state = Active }, 1 )
    , "inactive5" => ( { state = Inactive }, 5 )
    , "active25" => ( { state = Active }, 25 )
    , "inactive100" => ( { state = Inactive }, 100 )
    , "active500" => ( { state = Active }, 500 )
    , "inactive1000" => ( { state = Inactive }, 1000 )
    , "active9999" => ( { state = Active }, 9999 )
    ]


viewStories =
    renderStories (uncurry view >> toHtmlWithSymbol) stories
