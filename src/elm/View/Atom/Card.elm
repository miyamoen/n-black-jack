module View.Atom.Card exposing (view)

import Colors exposing (Colors, Hue(..), Shade(..))
import Element exposing (..)
import Element.Attributes exposing (..)
import Styles.Types as Styles exposing (Styles)
import Types exposing (Card, Suit(..))
import View.Symbol as Symbol


view : Card -> Element Styles variation msg
view card =
    Symbol.element 72 110 (Symbol.Card card)
        |> el (Styles.Card card.suit)
            [ width <| px 72
            , height <| px 110
            ]
