module Stories.Atom.Colors exposing (viewStories)

import Colors exposing (..)
import Element exposing (..)
import Element.Attributes exposing (height, px, vary, width)
import Rocket exposing ((=>))
import Stories.Element
import Styles exposing (Styles(..), Variation(..))
import UIExplorer exposing (renderStories)


view : () -> Element Styles Variation msg
view _ =
    column None [] <| List.map pallet Colors.colors


box : Shade -> Colors -> Element Styles Variation msg
box shade colors =
    el None
        [ width <| px 50
        , height <| px 50
        , vary (BGColor shade colors) True
        ]
        empty


pallet : Colors -> Element Styles Variation msg
pallet colors =
    row None [] <| List.map (flip box colors) Colors.shades


stories : List ( String, () )
stories =
    [ "AllColors" => () ]


viewStories =
    renderStories (view >> Stories.Element.toHtml) stories
