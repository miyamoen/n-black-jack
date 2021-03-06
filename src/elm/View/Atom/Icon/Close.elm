module View.Atom.Icon.Close exposing (Config, view)

import Color.Pallet exposing (Pallet)
import Element exposing (..)
import Element.Attributes exposing (vary)
import FontAwesome as FA exposing (..)
import FontAwesome.Layers exposing (..)
import Html.Attributes exposing (style)
import Html.Keyed
import Rocket exposing ((=>))
import Types.Styles as Styles exposing (..)
import Types.Styles.Text as Text exposing (Size(Medium), Variation(SizeVar))


type alias Config a =
    { a
        | pallet : Pallet
        , size : Text.Size
    }


view : Config a -> RootElement msg
view { pallet, size } =
    el Text [ vary (PalletVar pallet) True, vary (TextVar <| SizeVar size) True ] <|
        html <|
            Html.Keyed.node "div"
                []
                [ toString "close-icon"
                    => layers
                        [ IconLayer FA.circle Solid [] []
                        , IconLayer FA.times
                            Solid
                            [ Size ExtraSmall ]
                            [ style [ "color" => "rgb(235,235,235)" ] ]
                        ]
                        [ LayerHasFixedWidth ]
                ]
