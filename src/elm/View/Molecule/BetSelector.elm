module View.Molecule.BetSelector exposing (Show, view)

import Element exposing (..)
import Element.Attributes exposing (..)
import List.Extra exposing (unique)
import Styles.Types exposing (..)
import Types exposing (BetLimit)
import View.Atom.ChipButton as ChipButton


type alias Show a b =
    { a
        | betLimit : BetLimit
        , me : { b | bet : Maybe Int, betHistory : List Int }
    }


bets : List Int
bets =
    [ 1, 5, 25, 100, 500, 1000 ]


view : Show a b -> Element Styles Variation msg
view ({ betLimit, me } as show) =
    let
        filetered =
            bets
                |> List.filter (\bet -> bet <= betLimit.max)
    in
    column None
        []
        [ List.map (chipButton show) filetered
            |> row None []
        , me.betHistory
            |> unique
            |> List.take (List.length filetered)
            |> List.map (chipButton show)
            |> row None []
        ]


chipButton : Show a b -> Int -> Element Styles Variation msg
chipButton { betLimit, me } chip =
    column None
        [ width <| px 120
        , height <| px 120
        , center
        , verticalCenter
        ]
        [ ChipButton.view
            { state =
                if Maybe.withDefault 0 me.bet + chip <= betLimit.max then
                    Active
                else
                    Inactive
            }
            chip
        ]
