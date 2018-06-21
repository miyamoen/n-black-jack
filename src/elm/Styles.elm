module Styles exposing (styleSheet)

import Color
import Color.Chip as Chip
import Color.Pallet as Pallet
import Style exposing (..)
import Style.Background as Background
import Style.Border as Border
import Style.Color as Color
import Style.Shadow as Shadow
import Style.Sheet exposing (mix)
import Styles.ActionButton as ActionButton
import Styles.Button as Button
import Styles.ChipButton as ChipButton
import Styles.Frame as Frame
import Styles.TableText as TableText
import Styles.Text as Text
import Types exposing (Suit(..))
import Types.Styles exposing (Styles(..), Variation(..))


styleSheet : StyleSheet Styles Variation
styleSheet =
    Style.styleSheet
        [ style None []
        , Frame.styles
        , Text.styles
        , Button.styles
        , chipStyles
        , cardStyles
        , iconStyles
        , style AccountCard
            [ Shadow.box
                { offset = ( 0, 1 )
                , size = 0
                , blur = 2
                , color = Color.rgba 0 0 0 0.3
                }
            , Color.background <| Pallet.color Pallet.White
            ]
        , style Avatar
            [ Border.rounded 50
            , Border.all 2
            , Color.border <| Pallet.color Pallet.White
            , Color.background <| Pallet.color Pallet.White
            ]
        , ActionButton.styles
        , ChipButton.styles
        , style Table
            [ Color.background <| Pallet.color_ Pallet.Green Pallet.Main
            , Background.imageWith
                { src = "./argyle.png"
                , position = ( 0, 0 )
                , repeat = Background.repeat
                , size = Background.natural
                }
            ]
        , TableText.styles
        , style ModalBack [ Color.background <| Color.rgba 0 0 0 0.3 ]
        ]


{-| to fill Svg
-}
chipStyles : Style Styles variation
chipStyles =
    Chip.pallets
        |> List.map
            (\pallet ->
                style (Chip pallet)
                    [ Color.text <| Chip.color pallet ]
            )
        |> mix


{-| to fill Svg
-}
cardStyles : Style Styles variation
cardStyles =
    Types.suits
        |> List.map
            (\suit ->
                style (Card suit)
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
        |> mix


iconStyles : Style Styles variation
iconStyles =
    Pallet.pallets
        |> List.map
            (\pallet ->
                style (Icon pallet)
                    [ Color.text <| Pallet.color pallet ]
            )
        |> mix
