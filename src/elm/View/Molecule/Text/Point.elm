module View.Molecule.Text.Point exposing (view)

import Model.Card as Card
import Types exposing (Card, Face(..), Point(..))
import Types.Styles exposing (..)
import View.Atom.Text as Text exposing (Config, view)


view : Config a -> List Card -> RootElement msg
view config cards =
    case Card.point <| List.filter (.face >> (==) Up) cards of
        BlackJack ->
            Text.view config "Black Jack"

        TwentyOne ->
            Text.view config "21"

        Point point ->
            Text.view config <| toString point

        PointOr high low ->
            Text.view config <|
                toString high
                    ++ "/"
                    ++ toString low

        Bust ->
            Text.view config "Bust"
