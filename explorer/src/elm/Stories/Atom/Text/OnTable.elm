module Stories.Atom.Text.OnTable exposing (viewStories)

import Element exposing (el)
import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtml)
import Types.Styles exposing (..)
import Types.Styles.Text exposing (..)
import UIExplorer exposing (renderStories)
import View.Atom.Text.OnTable as TextOnTable exposing (Config, view)


view : () -> RootElement msg
view _ =
    el Board [] <| TextOnTable.view default "Black Jack"


default : Config {}
default =
    { size = Medium
    , line = OneLine
    , align = Center
    }


stories : List ( String, () )
stories =
    [ "default" => () ]


viewStories =
    renderStories (view >> toHtml) stories


main =
    fromStories viewStories
