module View.Atom.TableText exposing (view)

import App.Text exposing (dealerRule, payRule)
import Colors exposing (..)
import Element exposing (..)
import Styles.Types exposing (..)
import Types exposing (Phase(..))
import View.Atom.Text as Text


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
    Text.label
        { size = Large
        , style = RegularItaric
        , color = Colors Orange Lighten1
        }
