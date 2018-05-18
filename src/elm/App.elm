module App exposing (Model, Msg(..), init, update)

import Firebase exposing (signIn, signOut)
import Rocket exposing ((=>))
import Types exposing (..)


---- MODEL ----


type alias Model =
    { identity : User }


init : ( Model, List (Cmd Msg) )
init =
    { identity = Unauthenticated } => []



---- UPDATE ----


type Msg
    = NoOp
    | SignIn
    | SignInAnonymously
    | SignOut


update : Msg -> Model -> ( Model, List (Cmd Msg) )
update msg model =
    case msg of
        NoOp ->
            model => []

        SignIn ->
            model => [ Firebase.signIn () ]

        SignOut ->
            model => [ Firebase.signOut () ]

        SignInAnonymously ->
            model => [ Firebase.signInAnonymously () ]
