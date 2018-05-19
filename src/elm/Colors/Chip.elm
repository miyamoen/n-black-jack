module Colors.Chip exposing (Colors(..), color, colors)

import Color exposing (Color, rgb)


type Colors
    = Blue
    | Red
    | Green
    | Black
    | Purple
    | Yellow
    | Gray


colors : List Colors
colors =
    [ Blue, Red, Green, Black, Purple, Yellow, Gray ]


color : Colors -> Color
color colors =
    case colors of
        Blue ->
            rgb 81 187 254

        Red ->
            rgb 255 89 100

        Green ->
            rgb 143 247 167

        Black ->
            rgb 65 60 88

        Purple ->
            rgb 122 48 108

        Yellow ->
            rgb 244 231 110

        Gray ->
            rgb 186 199 190
