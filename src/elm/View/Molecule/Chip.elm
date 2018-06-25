module View.Molecule.Chip exposing (pallet, view)

import Color.Chip as Chip exposing (Pallet(..))
import Color.Pallet exposing (Hue(Mono), Pallet(Pallet), Shade(Darken2))
import Element exposing (..)
import Element.Attributes exposing (..)
import Types.Styles exposing (..)
import Types.Styles.Symbol exposing (..)
import Types.Styles.Text exposing (..)
import View.Atom.Text as Text
import View.Symbol as Symbol


view : Int -> RootElement msg
view price =
    let
        size_ =
            size price
    in
    Symbol.element size_ size_ Symbol.Chip
        |> el Symbol
            [ width <| px size_
            , height <| px size_
            , vary (SymbolVar <| ChipPalletVar <| pallet price) True
            ]
        |> within
            [ el None [ center, verticalCenter ] <|
                Text.view textConfig <|
                    toString price
            ]


pallet : Int -> Chip.Pallet
pallet price =
    if price <= 0 then
        Gray
    else if price < 5 then
        Blue
    else if price < 25 then
        Red
    else if price < 100 then
        Green
    else if price < 500 then
        Black
    else if price < 1000 then
        Purple
    else
        Yellow


size : Int -> number
size price =
    if price <= 0 then
        100
    else if price < 5 then
        60
    else if price < 100 then
        80
    else if price < 1000 then
        100
    else
        120


textConfig : Text.Config {}
textConfig =
    { style = RegularItaric
    , size = Normal
    , align = Center
    , line = OneLine
    , pallet = Just <| Pallet Mono Darken2
    , onTable = False
    }
