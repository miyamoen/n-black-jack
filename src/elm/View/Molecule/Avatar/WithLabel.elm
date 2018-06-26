module View.Molecule.Avatar.WithLabel exposing (view)

import Color.Pallet exposing (..)
import Element exposing (..)
import Element.Attributes exposing (..)
import Types exposing (Account(..))
import Types.Styles exposing (..)
import Types.Styles.Text exposing (..)
import View.Atom.Text as Text
import View.Molecule.Avatar as Avatar
import View.Molecule.Text.Chip as ChipLabel


view : Account -> RootElement msg
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


chipLabel : Account -> RootElement msg
chipLabel account =
    ChipLabel.view textConfig <|
        case account of
            Anonymous { chip } ->
                chip

            Authenticated { chip } ->
                chip

            Unauthenticated ->
                0


nameLabel : Account -> RootElement msg
nameLabel account =
    Text.view textConfig <|
        case account of
            Anonymous _ ->
                "anonymous"

            Authenticated { name } ->
                Maybe.withDefault "no name" name

            Unauthenticated ->
                "unauthenticated"


textConfig : Text.Config {}
textConfig =
    { style = Regular
    , size = Tiny
    , line = OneLine
    , align = Center
    , pallet = Just <| Pallet Orange Lighten1
    , onTable = False
    }
