module View.Atom.Icon exposing (Config, view)

import Color.Pallet exposing (Pallet)
import Element exposing (..)
import Element.Attributes exposing (vary)
import FontAwesome as FA exposing (Icon)
import Html.Keyed
import Rocket exposing ((=>))
import Types.Styles as Styles exposing (RootElement, Styles(..), Variation(PalletVar))


type alias Config a =
    { a
        | options : List FA.Option
        , pallet : Pallet
    }


view : Config a -> Icon -> RootElement msg
view { options, pallet } icon =
    el Text [ vary (PalletVar pallet) True ] <|
        html <|
            Html.Keyed.node "div"
                []
                [ toString icon
                    => FA.iconWithOptions icon FA.Solid options []
                ]
