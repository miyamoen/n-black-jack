module App.Route exposing (..)

import Types exposing (TableId)


type Route
    = Index
    | Tables
    | Table TableId
