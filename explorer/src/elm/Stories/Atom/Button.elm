module Stories.Atom.Button exposing (viewStories)

import Colors exposing (Colors, Hue(..), Shade(..))
import FontAwesome as FA exposing (Icon)
import Rocket exposing ((=>))
import Stories.Element exposing (toHtml)
import UIExplorer exposing (renderStories)
import View.Atom.Button exposing (Option, default, view)


stories : List ( String, ( Option, String ) )
stories =
    [ "default" => ( default, "default" )
    , "twitter"
        => ( { icon = Just FA.twitter
             , color = { hue = Blue, shade = Lighten2 }
             , labelColor = { hue = Mono, shade = Lighten2 }
             }
           , "sign in"
           )
    ]


viewStories =
    renderStories (uncurry view >> toHtml) stories
