port module Firebase exposing (..)

import Types exposing (CreateTable)


port signIn : () -> Cmd msg


port signInAnonymously : () -> Cmd msg


port signOut : () -> Cmd msg


{-| Only Admin User Cmd
-}
port createTable : CreateTable -> Cmd msg
