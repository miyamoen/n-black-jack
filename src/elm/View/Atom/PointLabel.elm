module View.Atom.PointLabel exposing (view)

import Element exposing (..)
import Styles exposing (Styles(..))
import Styles.Text exposing (..)
import Types exposing (Card, Face(..), Point(..))
import Types.Card as Card
import View.Atom.Text exposing (label)


view : Size -> List Card -> Element Styles variation msg
view size cards =
    case Card.point <| List.filter (.face >> (==) Up) cards of
        BlackJack ->
            label RegularItaric size "Black Jack"

        TwentyOne ->
            label RegularItaric size "21"

        Point point ->
            label RegularItaric size <| toString point

        PointOr high low ->
            label RegularItaric size <|
                toString high
                    ++ "/"
                    ++ toString low

        Bust ->
            label RegularItaric size "Bust"
