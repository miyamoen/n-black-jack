module View.Organism.Table.Base exposing (view)

import Element exposing (..)
import Element.Attributes exposing (..)
import Types exposing (Player)
import Types.Styles exposing (..)
import View.Molecule.Avatar.WithLabel as Avatar
import View.Molecule.Table.Box.Betting as BettingBox
import View.Molecule.Table.Box.Dealing as DealingBox


view : Maybe Player -> RootElement msg
view player =
    column None
        [ spacing 20
        , center
        , width <| px 120
        ]
        [ player
            |> Maybe.map .cards
            |> Maybe.withDefault []
            |> DealingBox.view
        , player
            |> Maybe.andThen .bet
            |> BettingBox.view
        , player
            |> Maybe.map (.account >> Avatar.view)
            |> Maybe.withDefault empty
        ]
