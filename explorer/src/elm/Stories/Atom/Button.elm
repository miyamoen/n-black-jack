module Stories.Atom.Button exposing (viewStories)

import Color.Pallet exposing (..)
import Element exposing (..)
import Rocket exposing ((=>))
import Stories.Element exposing (toHtml, toMain)
import Types.Styles exposing (RootElement)
import Types.Styles.Button exposing (State(..))
import UIExplorer exposing (renderStories)
import View.Atom.Button as Button exposing (Config)


view : ( Config a, State, RootElement msg ) -> RootElement msg
view ( config, state, element ) =
    Button.view config state element


stories : List ( String, ( Config {}, State, RootElement msg ) )
stories =
    [ "text" => ( { pallet = Just (Pallet Orange Main) }, Enable, text "button" )
    , "empty" => ( { pallet = Just Black }, Enable, empty )
    , "Disable" => ( { pallet = Just (Pallet Orange Main) }, Disable, text "button" )
    , "NoColor" => ( { pallet = Nothing }, Enable, text "button" )
    , "NoColorDisable" => ( { pallet = Nothing }, Disable, text "button" )
    ]


viewStories =
    renderStories (view >> Stories.Element.toHtml) stories


main =
    toMain viewStories
