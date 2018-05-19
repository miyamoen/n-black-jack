module Stories.Atom.Table exposing (viewStories)

import Element exposing (Element, empty)
import Rocket exposing ((=>))
import Stories.Element exposing (toHtml)
import UIExplorer exposing (renderStories)
import View.Atom.Table exposing (view)


stories : List ( String, Element style variation msg )
stories =
    [ "empty" => empty ]


viewStories =
    renderStories (view >> toHtml) stories
