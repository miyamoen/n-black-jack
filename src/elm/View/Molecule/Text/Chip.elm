module View.Molecule.Text.Chip exposing (Config, view)

import Color.Pallet exposing (Hue(Orange), Pallet, Shade(Lighten1))
import Element exposing (..)
import Element.Attributes exposing (..)
import Styles.Text as Text
import Types.Styles exposing (..)
import Types.Styles.Symbol exposing (..)
import Types.Styles.Text exposing (..)
import View.Atom.Text as Text
import View.Molecule.Chip exposing (pallet)
import View.Symbol as Symbol


type alias Config a =
    { a
        | size : Size
        , pallet : Pallet
        , onTable : Bool
    }


view : Config a -> Float -> RootElement msg
view config price =
    row None
        [ spacing 2, verticalCenter ]
        [ chipIcon config.size price
        , Text.view (textConfig config) <| toString price
        ]


chipIcon : Size -> Float -> RootElement msg
chipIcon size price =
    let
        size_ =
            Text.size size * 0.6
    in
    column Symbol
        [ width <| px size_
        , height <| px size_
        , vary (SymbolVar <| ChipPalletVar <| pallet <| round price) True
        , center
        , verticalCenter
        ]
        [ Symbol.element size_ size_ Symbol.Chip ]


textConfig : Config a -> Text.Config {}
textConfig { size, pallet, onTable } =
    { style = RegularItaric
    , size = size
    , line = OneLine
    , align = Left
    , pallet = pallet
    , onTable = onTable
    }
