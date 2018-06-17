port module Firebase
    exposing
        ( TableInfo
        , createTable_
        , signIn
        , signInAnonymously
        , signOut
        )

import Types exposing (..)


port signIn : () -> Cmd msg


port signInAnonymously : () -> Cmd msg


port signOut : () -> Cmd msg


{-| Only Admin User Cmd
-}
port createTable : CreateTable -> Cmd msg


createTable_ : TableInfo -> Cmd msg
createTable_ info =
    createTable
        { tableInfo = info
        , table = { phase = toString WaitingNextGame }
        }


type alias CreateTable =
    { tableInfo : TableInfo
    , table :
        { phase : String }
    }


type alias TableInfo =
    { name : String
    , betLimit : BetLimit
    , baseNumber : Int
    }
