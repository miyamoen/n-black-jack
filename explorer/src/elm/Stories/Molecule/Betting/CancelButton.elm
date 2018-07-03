module Stories.Molecule.Betting.CancelButton exposing (viewStories)

import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtml)
import UIExplorer exposing (renderStories)
import View.Molecule.Betting.CancelButton exposing (view)


stories : List ( String, () )
stories =
    [ "default" => () ]


viewStories =
    renderStories (always view >> toHtml) stories


main =
    fromStories viewStories
