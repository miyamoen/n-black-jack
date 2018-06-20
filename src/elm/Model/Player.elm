module Model.Player exposing (chip)

import Types exposing (..)


chip : Player -> Maybe Float
chip { account } =
    case account of
        Authenticated { chip } ->
            Just chip

        Anonymous { chip } ->
            Just chip

        Unauthenticated ->
            Nothing
