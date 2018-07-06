module Stories.Atom.Icon.Close exposing (viewStories)

import Color.Pallet exposing (..)
import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtml)
import Types.Styles.Text exposing (Size(..))
import UIExplorer exposing (renderStories)
import View.Atom.Icon.Close exposing (Config, view)


stories : List ( String, Config {} )
stories =
    [ "Green" => { pallet = Pallet Green Lighten1, size = Medium }
    , "Grey" => { pallet = Pallet Mono Lighten1, size = Medium }
    , "Tiny" => { pallet = Pallet Red Darken2, size = Tiny }
    , "Small" => { pallet = Pallet Blue Darken1, size = Small }
    , "Normal" => { pallet = Pallet Orange Main, size = Normal }
    , "Large" => { pallet = Pallet Red Main, size = Large }
    , "Huge" => { pallet = Black, size = Huge }
    ]


viewStories =
    renderStories (view >> toHtml) stories


main =
    fromStories viewStories
