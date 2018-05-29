module View.Atom.Icon exposing (Option, iconDefault, view)

import Colors exposing (Colors, Hue(Mono), Shade(Darken1))
import Element exposing (..)
import FontAwesome as FA exposing (Icon)
import Html.Keyed
import Rocket exposing ((=>))
import Styles.Types as Styles exposing (Styles(..), Variation(ColorVar))


type alias Option =
    { options : List FA.Option
    , color : Colors
    }


iconDefault : Option
iconDefault =
    { options = []
    , color = Colors Mono Darken1
    }


view : Option -> Icon -> Element Styles variation msg
view { options, color } icon =
    el (Styles.Icon color) [] <|
        html <|
            Html.Keyed.node "div"
                []
                [ toString icon
                    => FA.iconWithOptions icon FA.Solid options []
                ]
