module Stories.Atom.Button.WithLabel exposing (viewStories)

import Color.Pallet exposing (..)
import FontAwesome as FA exposing (Icon)
import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtml)
import Types.Styles exposing (RootElement)
import Types.Styles.Clickable exposing (State(..))
import Types.Styles.Text exposing (..)
import UIExplorer exposing (renderStories)
import View.Atom.Button.WithLabel as Button exposing (Config)


view : ( Config a, State, String ) -> RootElement msg
view ( config, state, text ) =
    Button.view config state text


iconConfig : Config {}
iconConfig =
    { icon = Just FA.twitter
    , bgPallet = Nothing
    , pallet = Just <| Pallet Blue Main
    , size = Medium
    , style = Regular
    }


config : Config {}
config =
    { icon = Nothing
    , bgPallet = Just <| Pallet Blue Lighten1
    , pallet = Just White
    , size = Medium
    , style = Regular
    }


stories : List ( String, ( Config {}, State, String ) )
stories =
    [ "normal" => ( config, Enable, "button" )
    , "disable" => ( config, Disable, "button" )
    , "icon" => ( iconConfig, Enable, "button" )
    , "iconNoLabel" => ( iconConfig, Enable, "" )
    ]


viewStories =
    renderStories (view >> Stories.Utils.toHtml) stories


main =
    fromStories viewStories
