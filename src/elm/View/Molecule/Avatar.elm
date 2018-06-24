module View.Molecule.Avatar exposing (view)

import Color.Pallet exposing (..)
import Element exposing (..)
import Element.Attributes exposing (..)
import FontAwesome as FA
import Types exposing (Account(..))
import Types.Styles exposing (..)
import View.Atom.Avatar as Avatar
import View.Atom.Icon as Icon


view : Account -> RootElement msg
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
                        Avatar.view
                            { width = px 80
                            , height = px 80
                            }
                            url

                Nothing ->
                    frame name <|
                        icon FA.user


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


icon : FA.Icon -> RootElement msg
icon =
    Icon.view { pallet = Pallet Mono Lighten2, options = [ FA.Size <| FA.Mult 4 ] }
