module View.Symbols exposing (view)

import Html exposing (Html)
import Svg exposing (..)
import Svg.Attributes exposing (display)
import View.Symbol exposing (simpleChip)
import View.Symbol.Card as Card
import View.Symbol.Chip as Chip


view : Html msg
view =
    svg [ display "none" ]
        [ defs []
            ([ simpleChip, Chip.symbol ]
                ++ Card.symbols
            )
        ]
