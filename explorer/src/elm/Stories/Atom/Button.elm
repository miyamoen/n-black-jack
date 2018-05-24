module Stories.Atom.Button exposing (viewStories)

import Colors exposing (Colors, Hue(..), Shade(..))
import Element exposing (Element, empty, text)
import FontAwesome as FA exposing (Icon)
import Rocket exposing ((=>))
import Stories.Element exposing (toHtml)
import UIExplorer exposing (renderStories)
import View.Atom.Button exposing (Option, default, view)


stories : List ( String, Option )
stories =
    [ "default" => default "default"
    , "twitter"
        => { icon = Just FA.twitter
           , color = Just { hue = Blue, shade = Lighten2 }
           , textColor = Just { hue = Mono, shade = Lighten2 }
           , label = "sign in"
           }
    ]


viewStories =
    renderStories (view >> toHtml) stories
