module View.Atom.PointLabel exposing (Option, pointLabelDefault, view)

import Colors exposing (Colors, Hue(Orange), Shade(Lighten1))
import Element exposing (..)
import Styles.Types exposing (..)
import Types exposing (Card, Face(..), Point(..))
import Types.Card as Card
import View.Atom.Text exposing (label)


type alias Option =
    { size : FontSize
    , color : Colors
    }


pointLabelDefault : Option
pointLabelDefault =
    { size = Medium
    , color = Colors Orange Lighten1
    }


view : Option -> List Card -> Element Styles Variation msg
view { size, color } cards =
    let
        option =
            { style = RegularItaric, size = size, color = color }
    in
    case Card.point <| List.filter (.face >> (==) Up) cards of
        BlackJack ->
            label option "Black Jack"

        TwentyOne ->
            label option "21"

        Point point ->
            label option <| toString point

        PointOr high low ->
            label option <|
                toString high
                    ++ "/"
                    ++ toString low

        Bust ->
            label option "Bust"
