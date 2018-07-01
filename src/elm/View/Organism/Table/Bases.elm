module View.Organism.Table.Bases exposing (Show, view)

import Element exposing (..)
import Element.Attributes exposing (..)
import Types exposing (..)
import Types.Styles as Styles exposing (..)
import View.Organism.Table.Base as Base


type alias Show a =
    { a | bases : Bases, me : Player }


view : Show a -> Element Styles Variation msg
view { bases, me } =
    case bases of
        FiveBases { first, second, third, fourth, fifth } ->
            row None
                [ spacing 100, spread ]
                [ base me first
                , base me second
                , base me third
                , base me fourth
                , base me fifth
                ]


base : Player -> Maybe Seating -> Element Styles Variation msg
base me seating =
    case seating of
        Just Me ->
            Base.view <| Just me

        Just (Other other) ->
            Base.view <| Just other

        Nothing ->
            Base.view Nothing
