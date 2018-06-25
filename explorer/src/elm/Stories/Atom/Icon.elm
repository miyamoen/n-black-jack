module Stories.Atom.Icon exposing (viewStories)

import Color.Pallet exposing (..)
import FontAwesome as FA exposing (Icon)
import Rocket exposing ((=>))
import Stories.Utils exposing (toHtml, fromStories)
import UIExplorer exposing (renderStories)
import View.Atom.Icon exposing (view)


stories : List ( String, Icon )
stories =
    [ "twitter" => FA.twitter
    , "taxi" => FA.taxi
    ]


viewStories =
    renderStories
        (view
            { options = []
            , pallet = Pallet Blue Lighten1
            }
            >> toHtml
        )
        stories


main =
    fromStories viewStories
