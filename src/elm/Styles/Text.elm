module Styles.Text exposing (baseSize, size, styles)

import Color.Pallet as Pallet
import Style exposing (..)
import Style.Color as Color
import Style.Filter as Filter
import Style.Font as Font
import Types.Styles as Root exposing (..)
import Types.Styles.Text exposing (..)


styles : Style Styles Root.Variation
styles =
    style Text <|
        List.concat
            [ styleVars
            , sizeVars
            , alignVars
            , textColorVars
            , [ variation (TextVar OnTable) [ Filter.opacity 80 ] ]
            ]


styleVars : List (Property style Root.Variation)
styleVars =
    List.map
        (\style ->
            variation (TextVar <| StyleVar style) <|
                case style of
                    Regular ->
                        []

                    RegularItaric ->
                        [ Font.italic ]

                    Bold ->
                        [ Font.bold ]

                    BoldItaric ->
                        [ Font.bold, Font.italic ]
        )
        fontStyles


sizeVars : List (Property style Root.Variation)
sizeVars =
    List.map
        (\s ->
            variation (TextVar <| SizeVar s)
                [ Font.size <| size s ]
        )
        sizes


size : Size -> Float
size s =
    case s of
        Huge ->
            baseSize * 5.8

        Large ->
            baseSize * 3.8

        Medium ->
            baseSize * 2.6

        Normal ->
            baseSize * 1.8

        Small ->
            baseSize * 1.4

        Tiny ->
            baseSize


baseSize : number
baseSize =
    16


alignVars : List (Property style Root.Variation)
alignVars =
    List.map
        (\align ->
            variation (TextVar <| AlignVar align)
                [ case align of
                    Left ->
                        Font.alignLeft

                    Center ->
                        Font.center

                    Right ->
                        Font.alignRight
                ]
        )
        aligns


textColorVars : List (Property style Root.Variation)
textColorVars =
    List.map
        (\pallet ->
            variation (PalletVar pallet)
                [ Color.text <| Pallet.color pallet ]
        )
        Pallet.pallets
