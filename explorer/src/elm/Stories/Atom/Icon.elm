module Stories.Atom.Icon exposing (viewStories)

import Element exposing (Element, empty, text)
import FontAwesome as FA exposing (Icon, Option)
import Rocket exposing ((=>))
import Stories.Element exposing (toHtml)
import UIExplorer exposing (renderStories)
import View.Atom.Icon exposing (view)


stories : List ( String, ( Icon, List Option ) )
stories =
    [ "twitter" => ( FA.twitter, [] )
    , "taxi" => ( FA.taxi, [] )
    ]


viewStories =
    renderStories (uncurry view >> toHtml) stories
