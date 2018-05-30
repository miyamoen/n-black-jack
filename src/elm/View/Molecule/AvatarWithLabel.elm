module View.Molecule.AvatarWithLabel exposing (view)

import Colors exposing (Colors, Hue(..), Shade(..))
import Element exposing (..)
import Element.Attributes exposing (..)
import Styles.Types exposing (..)
import Types exposing (User(..))
import View.Atom.Avatar as Avatar
import View.Atom.ChipLabel as ChipLabel exposing (chipLabelDefault)
import View.Atom.Text as Text exposing (description, label, textDefault)


view : User -> Element Styles Variation msg
view user =
    column None
        [ center, spacing 10 ]
        [ Avatar.view user
        , column None
            [ center, spacing 5 ]
            [ nameLabel user
            , chipLabel user
            ]
        ]


chipLabel : User -> Element Styles Variation msg
chipLabel user =
    case user of
        Anonymous { chip } ->
            ChipLabel.view { chipLabelDefault | color = Colors Mono Darken2 } chip

        Authenticated { chip } ->
            ChipLabel.view { chipLabelDefault | color = Colors Mono Darken2 } chip

        Unauthenticated ->
            empty


nameLabel : User -> Element Styles Variation msg
nameLabel user =
    label { textDefault | size = Small } <|
        case user of
            Anonymous _ ->
                "anonymous user"

            Authenticated { name } ->
                Maybe.withDefault "no name" name

            Unauthenticated ->
                "unauthenticated user"
