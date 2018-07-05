module Styles exposing (styleSheet)

import Color
import Color.Pallet as Pallet
import Style exposing (..)
import Style.Border as Border
import Style.Color as Color
import Style.Shadow as Shadow
import Styles.Board as Board
import Styles.Clickable as Clickable
import Styles.Frame as Frame
import Styles.Selector as Selector
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
        , Clickable.styles
        , Selector.styles
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
        , Board.styles
        , style ModalBack [ Color.background <| Color.rgba 0 0 0 0.3 ]
        ]
