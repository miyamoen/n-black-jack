module Stories.Atom.Frame exposing (viewStories)

import Colors exposing (Shade, shades)
import Element exposing (Element, el, empty)
import Element.Attributes exposing (..)
import List.Extra exposing (lift2)
import Rocket exposing ((=>))
import Stories.Element exposing (toHtml)
import Styles.Types exposing (Styles(..), Variation(..))
import UIExplorer exposing (renderStories)


view : ( Shade, Bool ) -> Element Styles Variation msg
view ( shade, isCircle ) =
    el Frame
        [ vary (ShadeVar shade) True
        , vary CircleShape isCircle
        , width <| px 200
        , height <| px 200
        ]
        empty


stories : List ( String, ( Shade, Bool ) )
stories =
    lift2
        (\isCircle shade ->
            toString shade
                ++ (if isCircle then
                        "Circle"
                    else
                        "Box"
                   )
                => ( shade, isCircle )
        )
        [ False, True ]
        shades


viewStories =
    renderStories (view >> toHtml) stories
