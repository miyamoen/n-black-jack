module Stories.Atom.Icon exposing (viewStories)

import FontAwesome as FA exposing (Icon, Option)
import Rocket exposing ((=>))
import Stories.Element exposing (toHtml)
import UIExplorer exposing (renderStories)
import View.Atom.Icon exposing (iconDefault, view)


stories : List ( String, Icon )
stories =
    [ "twitter" => FA.twitter
    , "taxi" => FA.taxi
    ]


viewStories =
    renderStories (view iconDefault >> toHtml) stories
