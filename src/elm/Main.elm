module Main exposing (..)

import App exposing (..)
import Html exposing (Html, button, div, h1, img, text)
import Rocket exposing (..)
import View exposing (view)


---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init |> batchInit
        , update = update >> batchUpdate
        , subscriptions = always Sub.none
        }
