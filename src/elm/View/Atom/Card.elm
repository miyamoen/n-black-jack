module View.Atom.Card exposing (view)

import Element exposing (..)
import Element.Attributes exposing (..)
import Types.Card exposing (Card)
import Types.Styles exposing (..)
import Types.Styles.Symbol exposing (Variation(SuitVar))
import View.Symbol as Symbol


view : Card -> RootElement msg
view card =
    Symbol.element 72 110 (Symbol.Card card)
        |> el Symbol
            [ width <| px 72
            , height <| px 110
            , vary (SymbolVar <| SuitVar card.suit) True
            ]
