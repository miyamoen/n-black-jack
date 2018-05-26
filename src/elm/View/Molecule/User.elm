module View.Molecule.User exposing (view)

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
    case user of
        Unauthenticated ->
            row UserCard
                [ center, padding 10, spacing 5 ]
                [ column None
                    [ verticalCenter ]
                    [ el None [ width <| px 80, height <| px 64 ] <|
                        Icon.view FA.userSlash [ FA.Size <| FA.Mult 4 ]
                    , label labelOption "unauth"
                    ]
                , column None
                    [ center ]
                    [ Button.view
                        { icon = Just FA.twitter
                        , color = Just { hue = Blue, shade = Lighten2 }
                        , textColor = Just { hue = Mono, shade = Lighten2 }
                        , label = "Twitter Sign In"
                        }
                    , label
                        { labelDefault
                            | style = RegularItaric
                            , color = Colors Mono Main
                        }
                        "or"
                    , Button.view
                        { icon = Just FA.signInAlt
                        , color = Just { hue = Mono, shade = Darken1 }
                        , textColor = Just { hue = Mono, shade = Lighten2 }
                        , label = "Anonymously Sign In"
                        }
                    ]
                ]

        Authenticated { id, name, iconUrl } ->
            row UserCard
                [ center, padding 10, spacing 5 ]
                [ column None
                    [ verticalCenter ]
                    [ avatar iconUrl ]
                , column None
                    [ spacing 5, alignTop, center ]
                    [ label labelDefault (Maybe.withDefault "" name)
                    , el None [ vary (TextColor { shade = Main, hue = Mono }) True ] <|
                        label labelOption id
                    , Button.view
                        { icon = Just FA.signOutAlt
                        , color = Just { hue = Mono, shade = Darken1 }
                        , textColor = Just { hue = Mono, shade = Lighten2 }
                        , label = "Sign Out"
                        }
                    ]
                ]

        Anonymous { id } ->
            row UserCard
                [ center, padding 10, spacing 5 ]
                [ column None
                    [ verticalCenter ]
                    [ el None [ width <| px 80, height <| px 64 ] <|
                        Icon.view FA.user [ FA.Size <| FA.Mult 4 ]
                    , label labelOption "anonymous"
                    ]
                , column None
                    [ spacing 5, alignTop, center ]
                    [ el None [ vary (TextColor { shade = Main, hue = Mono }) True ] <|
                        label labelOption id
                    , Button.view
                        { icon = Just FA.twitter
                        , color = Just { hue = Blue, shade = Lighten2 }
                        , textColor = Just { hue = Mono, shade = Lighten2 }
                        , label = "Sign In"
                        }
                    ]
                ]


labelDefault : Text.Option
labelDefault =
    Text.default


labelOption : Text.Option
labelOption =
    { labelDefault | size = Tiny, color = Colors Mono Main }


avatar : Maybe String -> Element Styles variation msg
avatar iconUrl =
    case iconUrl of
        Just url ->
            decorativeImage Avatar
                [ width <| px 80
                , height <| px 80
                ]
                { src = url }

        Nothing ->
            el None [ width <| px 80, height <| px 64 ] <|
                Icon.view FA.user [ FA.Size <| FA.Mult 4 ]
