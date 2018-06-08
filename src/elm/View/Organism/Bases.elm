module View.Organism.Bases exposing (view)

import Element exposing (..)
import Element.Attributes exposing (..)
import Styles.Types as Styles exposing (..)
import Types exposing (..)
import View.Organism.PlayerField as PlayerField


view : Table -> Element Styles Variation msg
view { bases, me } =
    case bases of
        FiveBases { first, second, third, fourth, fifth } ->
            row None
                [ spacing 30, spread ]
                [ playerField me first
                , playerField me second
                , playerField me third
                , playerField me fourth
                , playerField me fifth
                ]


playerField : Player -> Maybe Seating -> Element Styles Variation msg
playerField me seating =
    case seating of
        Just Me ->
            PlayerField.view <| Just me

        Just (Other other) ->
            PlayerField.view <| Just other

        Nothing ->
            PlayerField.view Nothing
