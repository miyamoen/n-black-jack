module View.Atom.Icon exposing (Config, view)

import Color.Pallet exposing (Pallet)
import Element exposing (..)
import Element.Attributes exposing (vary)
import FontAwesome as FA exposing (Icon)
import Html.Keyed
import Rocket exposing ((=>))
import Types.Styles as Styles exposing (RootElement, Styles(..), Variation(PalletVar, TextVar))
import Types.Styles.Text exposing (Size, Variation(SizeVar))


type alias Config a =
    { a
        | options : List FA.Option
        , pallet : Pallet
        , size : Size
    }


view : Config a -> Icon -> RootElement msg
view { options, pallet, size } icon =
    el Text
        [ vary (PalletVar pallet) True
        , vary (TextVar <| SizeVar size) True
        ]
    <|
        html <|
            Html.Keyed.node "div"
                []
                [ toString icon
                    => FA.iconWithOptions icon FA.Solid options []
                ]
