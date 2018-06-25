module Stories.Atom.Selector exposing (viewStories)

import Color.Pallet exposing (Hue(..), hues)
import Rocket exposing ((=>))
import Stories.Utils exposing (toHtml, fromStories)
import Types.Styles exposing (..)
import Types.Styles.Selector exposing (..)
import UIExplorer exposing (renderStories)
import View.Atom.Selector as Selector exposing (Config)


states : List State
states =
    [ Disable, Enable, Selected, Confirmed ]


view : ( Config a, State, String ) -> RootElement msg
view ( config, state, label ) =
    Selector.view config state label


stories : List ( String, ( Config {}, State, String ) )
stories =
    [ "Hit" => ( { hue = Blue }, Enable, "Hit" )
    , "Stand" => ( { hue = Red }, Enable, "Stand" )
    ]
        ++ List.map
            (\state ->
                toString state
                    => ( { hue = Blue }, state, "Hit" )
            )
            states
        ++ List.map (\hue -> toString hue => ( { hue = hue }, Enable, "Hit" )) hues


viewStories =
    renderStories (view >> toHtml) stories


main =
    fromStories viewStories
