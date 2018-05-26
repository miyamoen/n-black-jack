module View.Molecule.User exposing (view)

import Colors exposing (Hue(..), Shade(..))
import Element exposing (..)
import Element.Attributes exposing (..)
import FontAwesome as FA
import Styles.Types exposing (..)
import Types exposing (User(..))
import View.Atom.Button as Button
import View.Atom.Icon as Icon
import View.Atom.Text exposing (description, label)


view : User -> Element Styles Variation msg
view user =
    case user of
        Unauthenticated ->
            row UserCard
                [ center, padding 10, spacing 5 ]
                [ column None
                    [ verticalCenter, textColor ]
                    [ el None [ width <| px 80, height <| px 64 ] <|
                        Icon.view FA.userSlash [ FA.Size <| FA.Mult 4 ]
                    , label Regular Tiny "unauth"
                    ]
                , column None
                    [ center, textColor ]
                    [ Button.view
                        { icon = Just FA.twitter
                        , color = Just { hue = Blue, shade = Lighten2 }
                        , textColor = Just { hue = Mono, shade = Lighten2 }
                        , label = "Twitter Sign In"
                        }
                    , label RegularItaric Small "or"
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
                    [ label Regular Small (Maybe.withDefault "" name)
                    , el None [ vary (TextColor { shade = Main, hue = Mono }) True ] <|
                        label Regular Tiny id
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
                [ center, padding 10, spacing 5, textColor ]
                [ column None
                    [ verticalCenter, textColor ]
                    [ el None [ width <| px 80, height <| px 64 ] <|
                        Icon.view FA.user [ FA.Size <| FA.Mult 4 ]
                    , label Regular Tiny "anonymous"
                    ]
                , column None
                    [ spacing 5, alignTop, center ]
                    [ el None [ vary (TextColor { shade = Main, hue = Mono }) True ] <|
                        label Regular Tiny id
                    , Button.view
                        { icon = Just FA.twitter
                        , color = Just { hue = Blue, shade = Lighten2 }
                        , textColor = Just { hue = Mono, shade = Lighten2 }
                        , label = "Sign In"
                        }
                    ]
                ]


textColor : Attribute Variation msg
textColor =
    vary (TextColor { hue = Mono, shade = Main }) True


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
