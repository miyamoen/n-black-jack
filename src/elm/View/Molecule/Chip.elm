module View.Molecule.Chip exposing (view)

import Colors.Chip as Colors exposing (Colors(..))
import Element exposing (..)
import Element.Attributes exposing (..)
import Styles exposing (Styles(..))
import Styles.Text exposing (FontStyle(..), Size(..))
import View.Atom.Text exposing (label)
import View.Symbol as Symbol


view : Int -> Element Styles variation msg
view price =
    let
        size_ =
            size price
    in
    Symbol.element size_ size_ Symbol.Chip
        |> el (Chip <| color price)
            [ width <| px size_, height <| px size_ ]
        |> within
            [ el None [ center, verticalCenter ] <|
                label RegularItaric Medium <|
                    toString price
            ]


color : Int -> Colors
color price =
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
