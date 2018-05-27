module View.Atom.Chip exposing (color, view)

import Colors exposing (Hue(Mono), Shade(Darken1))
import Colors.Chip as Colors exposing (Colors(..))
import Element exposing (..)
import Element.Attributes exposing (..)
import Styles.Types exposing (FontSize(..), FontStyle(..), Styles(..), Variation)
import View.Atom.Text exposing (default, label)
import View.Symbol as Symbol


view : Int -> Element Styles Variation msg
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
                label
                    { default
                        | style = RegularItaric
                        , size = Medium
                        , color = { hue = Mono, shade = Darken1 }
                    }
                <|
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
