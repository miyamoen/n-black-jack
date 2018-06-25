module Stories.Atom.Avatar exposing (viewStories)

import Element.Attributes exposing (..)
import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtml)
import UIExplorer exposing (renderStories)
import View.Atom.Avatar exposing (Config, view)


me : String
me =
    "https://pbs.twimg.com/profile_images/438670444409806849/Vnzne20N_normal.jpeg"


stories : List ( String, ( Config {}, String ) )
stories =
    [ "fill" => ( { width = fill, height = fill }, me )
    , "content" => ( { width = content, height = content }, me )
    , "80" => ( { width = px 80, height = px 80 }, me )
    , "invalid" => ( { width = px 80, height = px 80 }, "" )
    ]


viewStories =
    renderStories (uncurry view >> toHtml) stories


main =
    fromStories viewStories
