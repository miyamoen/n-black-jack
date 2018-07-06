module Stories.Atom.Button.Bet exposing (viewStories)

import Color.Pallet exposing (..)
import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtml)
import Types.Styles.Clickable exposing (..)
import Types.Styles.Text exposing (Size(..))
import UIExplorer exposing (renderStories)
import View.Atom.Button.Bet exposing (Config, view)


stories : List ( String, ( Config {}, State ) )
stories =
    [ "Green" => ( { pallet = Pallet Green Lighten1, size = Medium }, Enable )
    , "GreenDisable" => ( { pallet = Pallet Green Lighten1, size = Medium }, Disable )
    , "Grey" => ( { pallet = Pallet Mono Lighten1, size = Medium }, Enable )
    , "GreyDisable" => ( { pallet = Pallet Mono Lighten1, size = Medium }, Disable )
    , "Tiny" => ( { pallet = Pallet Red Darken2, size = Tiny }, Enable )
    , "Small" => ( { pallet = Pallet Blue Darken1, size = Small }, Enable )
    , "Normal" => ( { pallet = Pallet Orange Main, size = Normal }, Enable )
    , "Large" => ( { pallet = White, size = Large }, Disable )
    , "Huge" => ( { pallet = Black, size = Huge }, Enable )
    ]


viewStories =
    renderStories (uncurry view >> toHtml) stories


main =
    fromStories viewStories
