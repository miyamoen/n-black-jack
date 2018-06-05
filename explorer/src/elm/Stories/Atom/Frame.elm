module Stories.Atom.Frame exposing (viewStories)

import Colors exposing (Shade, shades)
import Element exposing (Element, el, empty)
import Element.Attributes exposing (..)
import List.Extra exposing (lift2)
import Rocket exposing ((=>))
import Stories.Element exposing (toHtml)
import Styles.Types exposing (Shape(..), Styles(..), Variation(..))
import UIExplorer exposing (renderStories)


view : ( Shade, Shape ) -> Element Styles Variation msg
view ( shade, shape ) =
    el Frame
        [ vary (ShadeVar shade) True
        , vary (ShapeVar shape) True
        , width <| px 400
        , height <| px 200
        ]
        empty


stories : List ( String, ( Shade, Shape ) )
stories =
    lift2
        (\shape shade ->
            toString shade
                ++ toString shape
                => ( shade, shape )
        )
        [ Rectangle, Circle, Semicircle ]
        shades


viewStories =
    renderStories (view >> toHtml) stories
