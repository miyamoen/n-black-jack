module View.Atom.TableRule exposing (view)

import App.Text exposing (dealerRule, payRule)
import Colors exposing (..)
import Element exposing (..)
import Styles.Types exposing (..)
import Types exposing (Phase(..))
import View.Atom.TableText as TableText


view : Phase -> Element Styles Variation msg
view phase =
    case phase of
        WaitingBet ->
            label payRule

        DealingCards ->
            label dealerRule

        PlayerAction ->
            label dealerRule

        DealerAction ->
            label dealerRule

        WaitingNextGame ->
            label payRule


label : String -> Element Styles Variation msg
label =
    TableText.view { size = Large }
