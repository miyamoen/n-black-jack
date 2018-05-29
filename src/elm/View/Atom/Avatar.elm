module View.Atom.Avatar exposing (view)

import Element exposing (..)
import Element.Attributes exposing (..)
import FontAwesome as FA
import Styles.Types exposing (..)
import Types exposing (User(..))
import View.Atom.Icon as Icon exposing (iconDefault)


view : User -> Element Styles Variation msg
view user =
    case user of
        Unauthenticated ->
            frame (Just "Unauthenticated") <| icon FA.userSlash

        Anonymous _ ->
            frame (Just "Anonymous user") <| icon FA.user

        Authenticated { iconUrl, name } ->
            case iconUrl of
                Just url ->
                    frame name <|
                        decorativeImage None
                            [ width <| px 80
                            , height <| px 80
                            ]
                            { src = url }

                Nothing ->
                    frame name <| icon FA.user


frame : Maybe String -> Element Styles variation msg -> Element Styles variation msg
frame name image =
    column Avatar
        [ width <| px 80
        , height <| px 80
        , clip
        , attribute "title" <| Maybe.withDefault "no name" name
        , center
        , verticalCenter
        ]
        [ image ]


icon : FA.Icon -> Element Styles variation msg
icon =
    Icon.view { iconDefault | options = [ FA.Size <| FA.Mult 4 ] }
