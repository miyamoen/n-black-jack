module Stories.Atom.Button exposing (viewStories)

import Color.Pallet exposing (..)
import Element exposing (..)
import Rocket exposing ((=>))
import Stories.Utils exposing (toHtml, fromStories)
import Types.Styles exposing (RootElement)
import Types.Styles.Button exposing (State(..))
import UIExplorer exposing (renderStories)
import View.Atom.Button as Button exposing (Config)


view : ( Config a, State, RootElement msg ) -> RootElement msg
view ( config, state, element ) =
    Button.view config state element


stories : List ( String, ( Config {}, State, RootElement msg ) )
stories =
    [ "text" => ( { bgPallet = Just (Pallet Orange Main) }, Enable, text "button" )
    , "empty" => ( { bgPallet = Just Black }, Enable, empty )
    , "Disable" => ( { bgPallet = Just (Pallet Orange Main) }, Disable, text "button" )
    , "NoColor" => ( { bgPallet = Nothing }, Enable, text "button" )
    , "NoColorDisable" => ( { bgPallet = Nothing }, Disable, text "button" )
    ]


viewStories =
    renderStories (view >> Stories.Utils.toHtml) stories


main =
    fromStories viewStories
