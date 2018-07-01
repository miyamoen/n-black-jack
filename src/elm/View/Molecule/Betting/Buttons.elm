module View.Molecule.Betting.Buttons exposing (Data, view)

import Element exposing (..)
import Element.Attributes exposing (..)
import PushableData as PD exposing (PushableData)
import Types exposing (Limit)
import Types.Firebase as Firebase
import Types.Styles exposing (..)
import View.Molecule.Betting.Button as BettingButton


type alias Data a =
    { a
        | bettingLimit : Limit
        , betting : PushableData Int Firebase.Error
    }


view : Data a -> Element Styles Variation msg
view { bettingLimit, betting } =
    availablePrices bettingLimit
        |> List.map
            (\price ->
                BettingButton.view
                    { price = price
                    , bettingLimit = bettingLimit
                    , betting = betting
                    }
            )
        |> row None
            [ alignBottom
            , padding 10
            , spacing 10
            ]


availablePrices : Limit -> List Int
availablePrices { max, min } =
    [ 1, 5, 25, 100, 500, 1000 ]
        |> List.filter (\price -> price <= max)
