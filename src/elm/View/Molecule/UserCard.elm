module View.Molecule.UserCard exposing (view)

import Colors exposing (Colors, Hue(..), Shade(..))
import Element exposing (..)
import Element.Attributes exposing (..)
import FontAwesome as FA
import Styles.Types exposing (..)
import Types exposing (User(..))
import View.Atom.Button as Button
import View.Atom.Icon as Icon
import View.Atom.Text as Text exposing (description, label)


view : User -> Element Styles Variation msg
view user =
    frame user <|
        case user of
            Unauthenticated ->
                [ Button.view
                    { buttonDefault
                        | icon = Just FA.twitter
                        , color = Colors Blue Lighten2
                    }
                    "Twitter Sign In"
                , label
                    { labelDefault
                        | style = RegularItaric
                        , color = Colors Mono Main
                    }
                    "or"
                , Button.view
                    { buttonDefault
                        | icon = Just FA.signInAlt
                        , color = Colors Mono Darken1
                    }
                    "Anonymously Sign In"
                ]

            Authenticated { id, name, iconUrl } ->
                [ label labelDefault (Maybe.withDefault "" name)
                , Button.view
                    { buttonDefault
                        | icon = Just FA.signOutAlt
                        , color = Colors Mono Darken1
                    }
                    "Sign Out"
                ]

            Anonymous { id } ->
                [ Button.view
                    { buttonDefault
                        | icon = Just FA.twitter
                        , color = Colors Blue Lighten2
                    }
                    "Sign In"
                ]


frame : User -> List (Element Styles Variation msg) -> Element Styles Variation msg
frame user right =
    row UserCard
        [ center, padding 10, spacing 5 ]
        [ column None [ verticalCenter, width <| px 80 ] <|
            avatar user
        , column None
            [ spacing 10
            , verticalCenter
            , center
            , minWidth <| px 220
            ]
            right
        ]


avatar : User -> List (Element Styles Variation msg)
avatar user =
    case user of
        Unauthenticated ->
            [ column Avatar
                [ width <| px 80, height <| px 80, clip, center, verticalCenter ]
                [ Icon.view iconOption FA.userSlash ]
            ]

        Anonymous { id } ->
            [ column Avatar
                [ width <| px 80, height <| px 80, clip, center, verticalCenter ]
                [ Icon.view iconOption FA.user ]
            , el None [ attribute "title" id ] <| label labelOption id
            ]

        Authenticated { iconUrl, id } ->
            case iconUrl of
                Just url ->
                    [ decorativeImage Avatar
                        [ width <| px 80
                        , height <| px 80
                        ]
                        { src = url }
                    , el None [ attribute "title" id ] <| label labelOption id
                    ]

                Nothing ->
                    [ column Avatar
                        [ width <| px 80, height <| px 80, clip, center, verticalCenter ]
                        [ Icon.view iconOption FA.userSlash ]
                    ]


buttonDefault : Button.Option
buttonDefault =
    Button.default


labelDefault : Text.Option
labelDefault =
    Text.default


labelOption : Text.Option
labelOption =
    { labelDefault | size = Tiny, color = Colors Mono Main }


iconDefault : Icon.Option
iconDefault =
    Icon.default


iconOption : Icon.Option
iconOption =
    { iconDefault | options = [ FA.Size <| FA.Mult 4 ] }
