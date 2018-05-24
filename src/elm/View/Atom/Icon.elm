module View.Atom.Icon exposing (view)

import Element exposing (..)
import FontAwesome as FA exposing (Icon, Option)
import Styles exposing (Styles(..))


view : Icon -> List Option -> Element Styles variation msg
view icon options =
    html <|
        FA.iconWithOptions icon FA.Solid options []
