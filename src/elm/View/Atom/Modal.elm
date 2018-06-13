module View.Atom.Modal exposing (view)

import Element exposing (..)
import Element.Attributes exposing (..)
import Styles.Types exposing (Styles(..))


view : Element Styles variation msg -> Element Styles variation msg
view content =
    screen <|
        column ModalBack
            [ center
            , verticalCenter
            , width fill
            , height fill
            ]
            [ content ]
