module View.Atom.Card exposing (view)

import Colors exposing (Colors, Hue(..), Shade(..))
import Element exposing (..)
import Element.Attributes exposing (..)
import Styles.Types exposing (Styles(..), Variation(TextColor))
import Types exposing (Card, Suit(..))
import View.Symbol as Symbol


view : Card -> Element Styles Variation msg
view card =
    Symbol.element 72 110 (Symbol.Card card)
        |> el None
            [ width <| px 72
            , height <| px 110
            , vary
                (TextColor
                    { shade = Main
                    , hue = colors card.suit
                    }
                )
                True
            ]


colors : Suit -> Hue
colors suit =
    case suit of
        Spade ->
            Blue

        Club ->
            Blue

        Heart ->
            Red

        Diamond ->
            Red
