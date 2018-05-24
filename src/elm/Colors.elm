module Colors
    exposing
        ( Colors(..)
        , Shade(..)
        , color
        , colors
        , shades
        )

{- http://paletton.com/#uid=72X0u0knFs6uEhMrnnpjzvAe-Gh -}

import Color exposing (Color, rgb)


type Colors
    = Green
    | Blue
    | Orange
    | Red
    | Mono


colors : List Colors
colors =
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


type alias Pallet =
    { main : Color
    , darken2 : Color
    , darken1 : Color
    , lighten1 : Color
    , lighten2 : Color
    }


shadeGetter : Shade -> Pallet -> Color
shadeGetter shade =
    case shade of
        Main ->
            .main

        Darken2 ->
            .darken2

        Darken1 ->
            .darken1

        Lighten1 ->
            .lighten1

        Lighten2 ->
            .lighten2


pallet : Colors -> Pallet
pallet colors =
    case colors of
        Green ->
            green

        Blue ->
            blue

        Orange ->
            orange

        Red ->
            red

        Mono ->
            mono


color : Shade -> Colors -> Color
color shade colors =
    shadeGetter shade <| pallet colors


mono : Pallet
mono =
    Pallet
        (rgb 157 157 157)
        (rgb 101 101 101)
        (rgb 139 139 139)
        (rgb 186 186 186)
        (rgb 209 209 209)


green : Pallet
green =
    Pallet
        (rgb 42 162 87)
        (rgb 4 103 41)
        (rgb 20 135 63)
        (rgb 71 183 113)
        (rgb 114 210 150)


blue : Pallet
blue =
    Pallet
        (rgb 41 113 141)
        (rgb 7 66 89)
        (rgb 21 91 117)
        (rgb 65 132 158)
        (rgb 109 170 194)


orange : Pallet
orange =
    Pallet
        (rgb 224 145 58)
        (rgb 142 77 6)
        (rgb 186 110 27)
        (rgb 252 178 98)
        (rgb 255 199 139)


red : Pallet
red =
    Pallet
        (rgb 224 87 58)
        (rgb 142 30 6)
        (rgb 186 55 27)
        (rgb 252 125 98)
        (rgb 255 159 139)
