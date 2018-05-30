module View.Molecule.UserCard exposing (view)

import Colors exposing (Colors, Hue(..), Shade(..))
import Element exposing (..)
import Element.Attributes exposing (..)
import FontAwesome as FA
import Styles.Types exposing (..)
import Types exposing (User(..))
import View.Atom.Avatar as Avatar
import View.Atom.Button as Button exposing (buttonDefault)
import View.Atom.ChipLabel as ChipLabel exposing (chipLabelDefault)
import View.Atom.Text as Text exposing (description, label, textDefault)


view : User -> Element Styles Variation msg
view user =
    frame user <|
        case user of
            Unauthenticated ->
                [ label textDefault "Unauthenticated"
                , twitterButton "Twitter Sign In"
                , label
                    { textDefault
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

            Anonymous { id, chip } ->
                [ label textDefault "Anonymus"
                , chipLabel chip
                , twitterButton "Sign In"
                ]

            Authenticated { id, name, iconUrl, chip } ->
                [ label textDefault (Maybe.withDefault "no name" name)
                , chipLabel chip
                , Button.view
                    { buttonDefault
                        | icon = Just FA.signOutAlt
                        , color = Colors Mono Darken1
                    }
                    "Sign Out"
                ]


frame : User -> List (Element Styles Variation msg) -> Element Styles Variation msg
frame user right =
    row UserCard
        [ center, padding 10, spacing 5 ]
        [ column None
            [ verticalCenter, width <| px 80 ]
            [ Avatar.view user ]
        , column None
            [ spacing 10
            , verticalCenter
            , center
            , minWidth <| px 220
            ]
            right
        ]


chipLabel : Float -> Element Styles Variation msg
chipLabel =
    ChipLabel.view { chipLabelDefault | color = Colors Mono Darken2 }


twitterButton : String -> Element Styles Variation msg
twitterButton label =
    Button.view
        { buttonDefault
            | icon = Just FA.twitter
            , color = Colors Blue Lighten2
        }
        label
