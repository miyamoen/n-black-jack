module Stories.Atom.ActionButton exposing (viewStories)

import Colors exposing (Colors, Hue(..), Shade(..), hues)
import Rocket exposing ((=>))
import Stories.Element exposing (toHtml)
import Styles.Types exposing (State(..), states)
import UIExplorer exposing (renderStories)
import View.Atom.ActionButton as AB exposing (Option, default, view)


stories : List ( String, Option )
stories =
    [ "Hit" => { default | label = "Hit", hue = Blue }
    , "Stand" => { default | label = "Stand", hue = Red }
    ]
        ++ List.map
            (\state ->
                toString state
                    => { default | state = state, hue = Blue, label = "Hit" }
            )
            states
        ++ List.map (\hue -> toString hue => { default | hue = hue }) hues


viewStories =
    renderStories (view >> toHtml) stories
