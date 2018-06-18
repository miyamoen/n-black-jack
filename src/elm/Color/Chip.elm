module Color.Chip exposing (Pallet(..), color, pallets)

import Color exposing (Color, rgb)


type Pallet
    = Blue
    | Red
    | Green
    | Black
    | Purple
    | Yellow
    | Gray


pallets : List Pallet
pallets =
    [ Blue, Red, Green, Black, Purple, Yellow, Gray ]


color : Pallet -> Color
color pallet =
    case pallet of
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
