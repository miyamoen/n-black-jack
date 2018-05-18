module View exposing (..)

import App exposing (..)
import Html exposing (Html, button, div, h1, img, text)
import Html.Attributes exposing (src)
import Html.Events exposing (onClick)


---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ img [ src "/logo.svg" ] []
        , h1 [] [ text "Your Elm App is working!" ]
        , button [ onClick SignIn ] [ text "twitter signIn" ]
        , button [ onClick SignOut ] [ text "signOut" ]
        , button [ onClick SignInAnonymously ] [ text "signIn Anonymously" ]
        ]
