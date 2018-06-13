module Stories.Atom.Modal exposing (viewStories)

import Element exposing (Element, empty, text)
import Rocket exposing ((=>))
import Stories.Element exposing (toHtmlWithSymbol)
import Styles.Types exposing (State(Active), Styles, Variation)
import UIExplorer exposing (renderStories)
import View.Atom.ChipButton as ChipButton
import View.Atom.Modal exposing (view)


stories : List ( String, Element Styles Variation msg )
stories =
    [ "ChipButton" => ChipButton.view { state = Active } 25
    , "text" => text "test"
    , "empty" => empty
    ]


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories
