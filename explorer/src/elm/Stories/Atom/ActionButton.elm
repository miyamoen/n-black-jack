module Stories.Atom.ActionButton exposing (viewStories)

import Colors exposing (Colors, Hue(..), Shade(..), hues)
import Rocket exposing ((=>))
import Stories.Element exposing (toHtml)
import Styles.Types exposing (State(..), states)
import UIExplorer exposing (renderStories)
import View.Atom.ActionButton as AB exposing (Option, actionButtonDefault, view)


stories : List ( String, Option )
stories =
    [ "Hit" => { actionButtonDefault | label = "Hit", hue = Blue }
    , "Stand" => { actionButtonDefault | label = "Stand", hue = Red }
    ]
        ++ List.map
            (\state ->
                toString state
                    => { actionButtonDefault | state = state, hue = Blue, label = "Hit" }
            )
            states
        ++ List.map (\hue -> toString hue => { actionButtonDefault | hue = hue }) hues


viewStories =
    renderStories (view >> toHtml) stories
