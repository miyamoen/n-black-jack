module Stories.Atom.Circle exposing (viewStories)

import Element exposing (Element, empty, text)
import Rocket exposing ((=>))
import Stories.Element exposing (toHtml)
import UIExplorer exposing (renderStories)
import View.Atom.Circle exposing (view)


stories : List ( String, Element style variation msg )
stories =
    [ "empty" => empty, "text" => text "dummy" ]


viewStories =
    renderStories (view >> toHtml) stories
