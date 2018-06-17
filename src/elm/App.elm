module App exposing (Model, Msg(..), init, update)

import Firebase exposing (signIn, signOut)
import Rocket exposing ((=>))
import Types exposing (..)


---- MODEL ----


type alias Model =
    { account : Account }


init : ( Model, List (Cmd Msg) )
init =
    { account = Unauthenticated } => []



---- UPDATE ----


type Msg
    = NoOp
    | SignIn
    | SignInAnonymously
    | SignOut
    | CreateTable


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

        CreateTable ->
            model
                => [ Firebase.createTable_
                        { name = "Test Table"
                        , betLimit = { min = 1, max = 25 }
                        , baseNumber = 5
                        }
                   ]
