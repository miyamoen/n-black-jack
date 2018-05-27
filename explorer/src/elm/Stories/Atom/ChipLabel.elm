module Stories.Atom.ChipLabel exposing (viewStories)

import List.Extra exposing (lift2)
import Rocket exposing ((=>))
import Stories.Element exposing (toHtmlWithSymbol)
import Styles.Types exposing (FontSize(..))
import UIExplorer exposing (renderStories)
import View.Atom.ChipLabel as ChipLabel exposing (Option, default, view)


stories : List ( String, ( Option, Float ) )
stories =
    lift2
        (\size chip ->
            toString size
                ++ toString chip
                => ( { default | size = size }, chip )
        )
        [ Medium, Small ]
        [ 0, 1, 10, 50, 100, 500, 1000, 10000 ]


viewStories =
    renderStories (uncurry view >> toHtmlWithSymbol) stories
