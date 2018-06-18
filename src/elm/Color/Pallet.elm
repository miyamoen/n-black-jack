module Color.Pallet
    exposing
        ( Hue(..)
        , Pallet(..)
        , Shade(..)
        , color
        , hues
        , pallets
        , shades
        )

{- http://paletton.com/#uid=72X0u0knFs6uEhMrnnpjzvAe-Gh -}

import Color exposing (Color, rgb)
import List.Extra exposing (lift2)


type Pallet
    = Pallet
        { hue : Hue
        , shade : Shade
        }
    | Black
    | White


color : Pallet -> Color
color pallet =
    case pallet of
        Black ->
            rgb 30 30 30

        White ->
            rgb 225 225 225

        Pallet { hue, shade } ->
            case ( hue, shade ) of
                ( Mono, Main ) ->
                    rgb 157 157 157

                ( Mono, Darken2 ) ->
                    rgb 101 101 101

                ( Mono, Darken1 ) ->
                    rgb 139 139 139

                ( Mono, Lighten1 ) ->
                    rgb 186 186 186

                ( Mono, Lighten2 ) ->
                    rgb 209 209 209

                ( Green, Main ) ->
                    rgb 42 162 87

                ( Green, Darken2 ) ->
                    rgb 4 103 41

                ( Green, Darken1 ) ->
                    rgb 20 135 63

                ( Green, Lighten1 ) ->
                    rgb 71 183 113

                ( Green, Lighten2 ) ->
                    rgb 114 210 150

                ( Blue, Main ) ->
                    rgb 41 113 141

                ( Blue, Darken2 ) ->
                    rgb 7 66 89

                ( Blue, Darken1 ) ->
                    rgb 21 91 117

                ( Blue, Lighten1 ) ->
                    rgb 65 132 158

                ( Blue, Lighten2 ) ->
                    rgb 109 170 194

                ( Orange, Main ) ->
                    rgb 224 145 58

                ( Orange, Darken2 ) ->
                    rgb 142 77 6

                ( Orange, Darken1 ) ->
                    rgb 186 110 27

                ( Orange, Lighten1 ) ->
                    rgb 252 178 98

                ( Orange, Lighten2 ) ->
                    rgb 255 199 139

                ( Red, Main ) ->
                    rgb 224 87 58

                ( Red, Darken2 ) ->
                    rgb 142 30 6

                ( Red, Darken1 ) ->
                    rgb 186 55 27

                ( Red, Lighten1 ) ->
                    rgb 252 125 98

                ( Red, Lighten2 ) ->
                    rgb 255 159 139


pallets : List Pallet
pallets =
    [ Black, White ]
        ++ lift2 (\hue shade -> Pallet { hue = hue, shade = shade }) hues shades


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
    [ Main, Darken2, Darken1, Lighten1, Lighten2 ]
