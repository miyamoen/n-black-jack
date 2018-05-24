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
    column None [] <| List.map pallet Colors.hues


box : Shade -> Hue -> Element Styles Variation msg
box shade hue =
    el None
        [ width <| px 50
        , height <| px 50
        , vary (BGColor { shade = shade, hue = hue }) True
        ]
        empty


pallet : Hue -> Element Styles Variation msg
pallet hue =
    row None [] <| List.map (flip box hue) Colors.shades


stories : List ( String, () )
stories =
    [ "AllColors" => () ]


viewStories =
    renderStories (view >> Stories.Element.toHtml) stories
