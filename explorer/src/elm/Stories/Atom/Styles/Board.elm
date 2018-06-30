module Stories.Atom.Styles.Board exposing (viewStories)

import Color.Pallet exposing (Hue, hues)
import Element exposing (Element, el, empty)
import Element.Attributes exposing (height, px, width)
import Element.Utils exposing (maybeVary)
import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtml)
import Types.Styles exposing (..)
import UIExplorer exposing (renderStories)


view : Maybe Hue -> RootElement m
view hue =
    el Board
        [ width <| px 500
        , height <| px 500
        , maybeVary HueVar hue
        ]
        empty


stories : List ( String, Maybe Hue )
stories =
    ("default" => Nothing)
        :: List.map (\hue -> toString hue => Just hue) hues


viewStories =
    renderStories (view >> toHtml) stories


main =
    fromStories viewStories
