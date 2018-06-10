module View.Molecule.BetSelector exposing (Show, view)

import Colors exposing (Shade(..))
import Element exposing (..)
import Element.Attributes exposing (..)
import List.Extra exposing (unique)
import Styles.Types exposing (..)
import Types exposing (BetLimit)
import View.Atom.Chip as Chip


type alias Show a b =
    { a
        | betLimit : BetLimit
        , me : { b | bet : Maybe Int, betHistory : List Int }
    }


bets : List Int
bets =
    [ 1, 5, 25, 100, 500, 1000 ]


view : Show a b -> Element Styles Variation msg -> Element Styles Variation msg
view { betLimit, me } centerElement =
    centerElement
        |> within
            (List.concat [ bets, me.betHistory ]
                |> unique
                |> List.filter (\bet -> bet <= betLimit.max)
                |> List.take 8
                |> List.indexedMap chipButton
            )


angle : Int -> Float
angle index =
    degrees <| toFloat index * (360 / 8)


chipButton : Int -> Int -> Element Styles Variation msg
chipButton index chip =
    el None
        [ center
        , verticalCenter
        , moveUp <| 130 * (cos <| angle index)
        , moveRight <| 130 * (sin <| angle index)
        ]
    <|
        Chip.view chip
