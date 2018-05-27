module View.Atom.ChipLabel exposing (Option, default, view)

import Colors exposing (Colors, Hue(Orange), Shade(Lighten1))
import Element exposing (..)
import Element.Attributes exposing (..)
import Styles.Types exposing (..)
import View.Atom.Chip exposing (color)
import View.Atom.Text exposing (label)
import View.Symbol as Symbol


type alias Option =
    { size : FontSize
    , color : Colors
    }


default : Option
default =
    { size = Small
    , color = Colors Orange Lighten1
    }


view : Option -> Float -> Element Styles Variation msg
view { size, color } chip =
    row None
        [ spacing 5, verticalCenter ]
        [ chipIcon size chip
        , label { style = RegularItaric, size = size, color = color } <|
            toString chip
        ]


chipIcon : FontSize -> Float -> Element Styles variation msg
chipIcon size chip =
    let
        size_ =
            chipSize size
    in
    Symbol.element size_ size_ Symbol.Chip
        |> el (Chip <| color <| floor chip)
            [ width <| px size_, height <| px size_ ]


chipSize : FontSize -> number
chipSize size =
    case size of
        Large ->
            40

        Medium ->
            30

        Small ->
            16

        Tiny ->
            12
