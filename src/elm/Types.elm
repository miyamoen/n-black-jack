module Types exposing (..)


type User
    = Authenticated
        { id : String
        , name : Maybe String
        , iconUrl : Maybe String
        }
    | Anonymous { id : String }
    | Unauthenticated
