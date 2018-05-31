module View.Molecule.AvatarWithLabel exposing (view)

import Colors exposing (Colors, Hue(..), Shade(..))
import Element exposing (..)
import Element.Attributes exposing (..)
import Styles.Types exposing (..)
import Types exposing (Account(..))
import View.Atom.Avatar as Avatar
import View.Atom.ChipLabel as ChipLabel exposing (chipLabelDefault)
import View.Atom.Text as Text exposing (description, label, textDefault)


view : Account -> Element Styles Variation msg
view account =
    column None
        [ center, spacing 10 ]
        [ Avatar.view account
        , column None
            [ center, spacing 5 ]
            [ nameLabel account
            , chipLabel account
            ]
        ]


chipLabel : Account -> Element Styles Variation msg
chipLabel account =
    case account of
        Anonymous { chip } ->
            ChipLabel.view { chipLabelDefault | color = Colors Mono Darken2 } chip

        Authenticated { chip } ->
            ChipLabel.view { chipLabelDefault | color = Colors Mono Darken2 } chip

        Unauthenticated ->
            empty


nameLabel : Account -> Element Styles Variation msg
nameLabel account =
    label { textDefault | size = Small } <|
        case account of
            Anonymous _ ->
                "anonymous account"

            Authenticated { name } ->
                Maybe.withDefault "no name" name

            Unauthenticated ->
                "unauthenticated account"
