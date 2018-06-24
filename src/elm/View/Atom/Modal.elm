module View.Atom.Modal exposing (view)

import Element exposing (..)
import Element.Attributes exposing (..)
import Types.Styles exposing (Styles(..))


view : Element Styles variation msg -> Element Styles variation msg
view element =
    screen <|
        column ModalBack
            [ center
            , verticalCenter
            , width fill
            , height fill
            ]
            [ element ]
