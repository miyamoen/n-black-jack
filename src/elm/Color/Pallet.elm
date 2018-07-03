module Color.Pallet
    exposing
        ( Hue(..)
        , Pallet(..)
        , Shade(..)
        , color
        , color_
        , hues
        , pallets
        , shades
        )

{- http://paletton.com/#uid=72X0u0knFs6uEhMrnnpjzvAe-Gh -}

import Color exposing (Color, rgb)
import List.Extra exposing (lift2)


type Pallet
    = Pallet Hue Shade
    | Black
    | White


color : Pallet -> Color
color pallet =
    case pallet of
        Black ->
            rgb 30 30 30

        White ->
            rgb 235 235 235

        Pallet Mono Main ->
            rgb 157 157 157

        Pallet Mono Darken2 ->
            rgb 101 101 101

        Pallet Mono Darken1 ->
            rgb 139 139 139

        Pallet Mono Lighten1 ->
            rgb 186 186 186

        Pallet Mono Lighten2 ->
            rgb 209 209 209

        Pallet Green Main ->
            rgb 42 162 87

        Pallet Green Darken2 ->
            rgb 4 103 41

        Pallet Green Darken1 ->
            rgb 20 135 63

        Pallet Green Lighten1 ->
            rgb 71 183 113

        Pallet Green Lighten2 ->
            rgb 114 210 150

        Pallet Blue Main ->
            rgb 41 113 141

        Pallet Blue Darken2 ->
            rgb 7 66 89

        Pallet Blue Darken1 ->
            rgb 21 91 117

        Pallet Blue Lighten1 ->
            rgb 65 132 158

        Pallet Blue Lighten2 ->
            rgb 109 170 194

        Pallet Orange Main ->
            rgb 224 145 58

        Pallet Orange Darken2 ->
            rgb 142 77 6

        Pallet Orange Darken1 ->
            rgb 186 110 27

        Pallet Orange Lighten1 ->
            rgb 252 178 98

        Pallet Orange Lighten2 ->
            rgb 255 199 139

        Pallet Red Main ->
            rgb 224 87 58

        Pallet Red Darken2 ->
            rgb 142 30 6

        Pallet Red Darken1 ->
            rgb 186 55 27

        Pallet Red Lighten1 ->
            rgb 252 125 98

        Pallet Red Lighten2 ->
            rgb 255 159 139


color_ : Hue -> Shade -> Color
color_ hue shade =
    color <| Pallet hue shade


pallets : List Pallet
pallets =
    [ Black, White ]
        ++ lift2 Pallet hues shades


type Hue
    = Green
    | Blue
    | Orange
    | Red
    | Mono


hues : List Hue
hues =
    [ Green, Blue, Orange, Red, Mono ]


type Shade
    = Main
    | Darken2
    | Darken1
    | Lighten1
    | Lighten2


shades : List Shade
shades =
    [ Darken2, Darken1, Main, Lighten1, Lighten2 ]
