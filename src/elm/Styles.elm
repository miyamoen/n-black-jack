module Styles exposing (styleSheet)

import Color
import Color.Pallet as Pallet
import Style exposing (..)
import Style.Background as Background
import Style.Border as Border
import Style.Color as Color
import Style.Shadow as Shadow
import Style.Sheet exposing (mix)
import Styles.ActionButton as ActionButton
import Styles.Button as Button
import Styles.Frame as Frame
import Styles.Symbol as Symbol
import Styles.Text as Text
import Types.Styles exposing (Styles(..), Variation(..))


styleSheet : StyleSheet Styles Variation
styleSheet =
    Style.styleSheet
        [ style None []
        , Frame.styles
        , Text.styles
        , Symbol.styles
        , Button.styles
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
        , style TableBoard
            [ Color.background <| Pallet.color_ Pallet.Green Pallet.Main
            , Background.imageWith
                { src = "./argyle.png"
                , position = ( 0, 0 )
                , repeat = Background.repeat
                , size = Background.natural
                }
            ]
        , style ModalBack [ Color.background <| Color.rgba 0 0 0 0.3 ]
        ]


iconStyles : Style Styles Variation
iconStyles =
    style Icon <|
        List.map
            (\pallet ->
                variation (PalletVar pallet)
                    [ Color.text <| Pallet.color pallet ]
            )
            Pallet.pallets
