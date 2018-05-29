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
import View.Atom.Icon as Icon exposing (iconDefault)
import View.Atom.Text as Text exposing (description, label, textDefault)


view : User -> Element Styles Variation msg
view user =
    frame user <|
        case user of
            Unauthenticated ->
                [ label textDefault "Unauthenticated"
                , Button.view
                    { buttonDefault
                        | icon = Just FA.twitter
                        , color = Colors Blue Lighten2
                    }
                    "Twitter Sign In"
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
                , ChipLabel.view chipLabelOption chip
                , Button.view
                    { buttonDefault
                        | icon = Just FA.twitter
                        , color = Colors Blue Lighten2
                    }
                    "Sign In"
                ]

            Authenticated { id, name, iconUrl, chip } ->
                [ label textDefault (Maybe.withDefault "no name" name)
                , ChipLabel.view chipLabelOption chip
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


idLabelOption : Text.Option
idLabelOption =
    { textDefault | size = Tiny, color = Colors Mono Main }


iconOption : Icon.Option
iconOption =
    { iconDefault | options = [ FA.Size <| FA.Mult 4 ] }


chipLabelOption : ChipLabel.Option
chipLabelOption =
    { chipLabelDefault | color = Colors Mono Darken2 }
