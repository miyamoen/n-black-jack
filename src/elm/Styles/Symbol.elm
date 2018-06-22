module Styles.Symbol exposing (styles)

import Color.Chip as Chip
import Color.Pallet as Pallet
import Style exposing (..)
import Style.Color as Color
import Style.Sheet as Sheet
import Types exposing (Suit(..), suits)
import Types.Styles as Root exposing (..)
import Types.Styles.Symbol as Child exposing (..)


styles : Style Styles Root.Variation
styles =
    List.concat
        [ chipPalletVars
        , suitVars
        ]
        |> style Symbol
        |> List.singleton
        |> Sheet.map identity SymbolVar
        |> Sheet.merge


chipPalletVars : List (Property style Child.Variation)
chipPalletVars =
    List.map
        (\pallet ->
            variation (ChipPalletVar pallet)
                [ Color.text <| Chip.color pallet ]
        )
        Chip.pallets


suitVars : List (Property style Child.Variation)
suitVars =
    List.map
        (\suit ->
            variation (SuitVar suit)
                [ Color.text <|
                    Pallet.color_
                        (case suit of
                            Spade ->
                                Pallet.Blue

                            Heart ->
                                Pallet.Red

                            Club ->
                                Pallet.Blue

                            Diamond ->
                                Pallet.Red
                        )
                        Pallet.Main
                ]
        )
        suits
