module Stories.Molecule.Button.Chip exposing (viewStories)

import Rocket exposing ((=>))
import Stories.Utils exposing (toHtml, fromStories)
import Types.Styles.Button exposing (..)
import UIExplorer exposing (renderStories)
import View.Molecule.Button.Chip exposing (view)


stories : List ( String, ( State, Int ) )
stories =
    [ "Enable1" => ( Enable, 1 )
    , "Disable5" => ( Disable, 5 )
    , "Enable25" => ( Enable, 25 )
    , "Disable100" => ( Disable, 100 )
    , "Enable500" => ( Enable, 500 )
    , "Disable1000" => ( Disable, 1000 )
    , "Enable9999" => ( Enable, 9999 )
    ]


viewStories =
    renderStories (uncurry view >> toHtml) stories


main =
    fromStories viewStories
