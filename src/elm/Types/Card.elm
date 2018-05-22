module Types.Card exposing (Point(..), point)

import Types exposing (..)


type Point
    = BlackJack
    | TwentyOne
    | Point Int
    | PointOr Int Int
    | Bust


point : List Card -> Point
point cards =
    let
        ( aceNum, low ) =
            List.foldl
                (\{ number } ( aceNum, low ) ->
                    case number of
                        Ace ->
                            ( aceNum + 1, low + 1 )

                        Two ->
                            ( aceNum, low + 2 )

                        Three ->
                            ( aceNum, low + 3 )

                        Four ->
                            ( aceNum, low + 4 )

                        Five ->
                            ( aceNum, low + 5 )

                        Six ->
                            ( aceNum, low + 6 )

                        Seven ->
                            ( aceNum, low + 7 )

                        Eight ->
                            ( aceNum, low + 8 )

                        Nine ->
                            ( aceNum, low + 9 )

                        Ten ->
                            ( aceNum, low + 10 )

                        Jack ->
                            ( aceNum, low + 10 )

                        Queen ->
                            ( aceNum, low + 10 )

                        King ->
                            ( aceNum, low + 10 )
                )
                ( 0, 0 )
                cards
    in
    if List.length cards == 2 && aceNum == 1 && low + 10 == 21 then
        BlackJack
    else if low == 21 then
        TwentyOne
    else if low > 21 then
        Bust
    else if aceNum > 0 && low + 10 == 21 then
        TwentyOne
    else if aceNum > 0 && low + 10 > 21 then
        Point low
    else if aceNum > 0 then
        PointOr (low + 10) low
    else
        Point low
