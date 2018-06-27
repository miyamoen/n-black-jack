module View.Atom.Layout.Modal exposing (view)

import Element exposing (..)
import Element.Attributes exposing (..)
import Types.Styles exposing (Styles(..))


view : Element Styles variation msg -> Element Styles variation msg
view element =
    modal ModalBack
        [ width fill
        , height fill
        ]
    <|
        el None [ center, verticalCenter ] element
