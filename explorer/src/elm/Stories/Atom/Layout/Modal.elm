module Stories.Atom.Layout.Modal exposing (viewStories)

import Color.Pallet exposing (..)
import Element exposing (Element, empty, text)
import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtml)
import Types.Styles exposing (RootElement)
import Types.Styles.Text exposing (..)
import UIExplorer exposing (renderStories)
import View.Atom.Layout.Modal exposing (view)
import View.Atom.Text as Text


textConfig : Text.Config {}
textConfig =
    { style = BoldItaric
    , size = Medium
    , line = OneLine
    , align = Center
    , pallet = Just <| Pallet Orange Lighten1
    , onTable = False
    }


stories : List ( String, RootElement msg )
stories =
    [ "Textview" => Text.view textConfig "Modal Text"
    , "text" => text "test"
    , "empty" => empty
    ]


viewStories =
    renderStories (view >> toHtml) stories


main =
    fromStories viewStories
