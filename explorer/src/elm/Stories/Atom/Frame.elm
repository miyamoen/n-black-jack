module Stories.Atom.Frame exposing (viewStories)

import Color.Pallet exposing (Shade, shades)
import Element exposing (Element, el, empty)
import Element.Attributes exposing (..)
import List.Extra exposing (lift2)
import Rocket exposing ((=>))
import Stories.Element exposing (toHtml, toMain)
import Types.Styles as Root exposing (Styles(..), Variation(..))
import Types.Styles.Frame exposing (Shape(..), Variation(..))
import UIExplorer exposing (renderStories)


type alias Config =
    { shade : Shade, shape : Shape }


view : Config -> Element Styles Root.Variation msg
view { shade, shape } =
    el Frame
        [ vary (ShadeVar shade) True
        , vary (FrameVar <| ShapeVar shape) True
        , width <| px 400
        , height <| px 200
        ]
        empty


stories : List ( String, Config )
stories =
    lift2
        (\shape shade ->
            toString shade
                ++ toString shape
                => { shade = shade, shape = shape }
        )
        [ Rectangle, Circle, Semicircle ]
        shades


viewStories =
    renderStories (view >> toHtml) stories


main =
    toMain viewStories
