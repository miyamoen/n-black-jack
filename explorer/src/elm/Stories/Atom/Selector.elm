module Stories.Atom.Selector exposing (viewStories)

import Color.Pallet exposing (Hue(..), hues)
import Element.Attributes exposing (px)
import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtml)
import Types.Styles exposing (..)
import Types.Styles.Selector exposing (..)
import Types.Styles.Text exposing (Size(Medium))
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
    [ "Hit" => ( config Blue, Enable, "Hit" )
    , "Stand"
        => ( { hue = Red
             , size = Medium
             , boxSize = px 120
             }
           , Enable
           , "Stand"
           )
    ]
        ++ List.map
            (\state ->
                toString state
                    => ( config Blue, state, "Hit" )
            )
            states
        ++ List.map (\hue -> toString hue => ( config hue, Enable, "Hit" )) hues


config : Hue -> Config {}
config hue =
    { hue = hue
    , size = Medium
    , boxSize = px 100
    }


viewStories =
    renderStories (view >> toHtml) stories


main =
    fromStories viewStories
