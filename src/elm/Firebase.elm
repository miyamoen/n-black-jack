port module Firebase exposing (..)


port signIn : () -> Cmd msg


port signInAnonymously : () -> Cmd msg


port signOut : () -> Cmd msg
