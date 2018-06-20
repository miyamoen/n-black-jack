module Styles.Font exposing (styles)

import Color.Pallet as Pallet
import List.Extra exposing (lift2)
import Style exposing (..)
import Style.Color as Color
import Style.Font as Font
import Style.Sheet exposing (mix)
import Types.Styles exposing (..)


styles : Style Styles Variation
styles =
    lift2
        (\style_ size_ ->
            [ bodyStyles style_ size_
            , labelStyles style_ size_
            ]
        )
        fontStyles
        fontSizes
        |> List.concat
        |> mix


bodyStyles : FontStyle -> FontSize -> Style Styles Variation
bodyStyles style_ size_ =
    style (Body style_ size_) <|
        fontStyle style_
            ++ [ Font.alignLeft
               , Font.lineHeight 1.3
               , Font.wordSpacing 3
               , size size_
               ]
            ++ textColors


labelStyles : FontStyle -> FontSize -> Style Styles Variation
labelStyles style_ size_ =
    style (Label style_ size_) <|
        size size_
            :: fontStyle style_
            ++ textColors


fontStyle : FontStyle -> List (Property style variation)
fontStyle fs =
    case fs of
        Regular ->
            []

        RegularItaric ->
            [ Font.italic ]

        Bold ->
            [ Font.bold ]

        BoldItaric ->
            [ Font.bold, Font.italic ]


size : FontSize -> Property class variation
size s =
    case s of
        Huge ->
            Font.size 60

        Large ->
            Font.size 40

        Medium ->
            Font.size 30

        Small ->
            Font.size 16

        Tiny ->
            Font.size 12


textColors : List (Property style Variation)
textColors =
    List.map
        (\pallet ->
            variation (PalletVar pallet)
                [ Color.text <| Pallet.color pallet ]
        )
        Pallet.pallets
