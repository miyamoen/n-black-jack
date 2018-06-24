module View.Atom.Avatar exposing (Config, view)

import Element exposing (..)
import Element.Attributes exposing (..)
import Types.Styles exposing (..)


type alias Config a =
    { a | width : Length, height : Length }


view : Config a -> String -> Element Styles Variation msg
view config url =
    decorativeImage None
        [ width config.width
        , height config.height
        ]
        { src = url }
