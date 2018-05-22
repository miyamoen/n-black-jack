module View.Atom.PointLabel exposing (view)

import Element exposing (..)
import Styles exposing (Styles(..))
import Styles.Text exposing (..)
import Types exposing (Card)
import Types.Card as Card exposing (Point(..))
import View.Atom.Text exposing (label)


view : Size -> List Card -> Element Styles variation msg
view size cards =
    case Card.point cards of
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
