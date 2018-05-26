module View.Atom.Icon exposing (view)

import Element exposing (..)
import FontAwesome as FA exposing (Icon, Option)
import Html.Keyed
import Rocket exposing ((=>))
import Styles.Types exposing (Styles(..))


view : Icon -> List Option -> Element Styles variation msg
view icon options =
    html <|
        Html.Keyed.node "div"
            []
            [ toString icon
                => FA.iconWithOptions icon FA.Solid options []
            ]
