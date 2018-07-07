module View.Molecule.Bet.Chips exposing (Data, view)

import Element exposing (..)
import Element.Attributes exposing (..)
import PushableData as PD exposing (PushableData)
import Types exposing (Limit)
import Types.Firebase as Firebase
import Types.Styles exposing (..)
import View.Molecule.Bet.Chip as Chip


type alias Data a =
    { a
        | limit : Limit
        , chip : PushableData Int Firebase.Error
    }


view : Data a -> RootElement msg
view { limit, chip } =
    availablePrices limit
        |> List.map
            (\price ->
                Chip.view
                    { price = price
                    , limit = limit
                    , chip = chip
                    }
            )
        |> row None [ alignBottom, spacing 10 ]


availablePrices : Limit -> List Int
availablePrices { max, min } =
    [ 1, 5, 25, 100, 500, 1000 ]
        |> List.filter (\price -> price <= max)
