module View.Atom.Button exposing (Option, default, view)

import Colors exposing (Colors, Hue(..), Shade(..))
import Element exposing (..)
import Element.Attributes exposing (..)
import FontAwesome exposing (Icon)
import Styles exposing (Styles(..), Variation(..))
import Styles.Text exposing (..)
import View.Atom.Icon as Icon
import View.Atom.Text as Text


type alias Option =
    { color : Maybe Colors
    , textColor : Maybe Colors
    , icon : Maybe Icon
    , label : String
    }


default : String -> Option
default label =
    { color = Nothing
    , textColor = Nothing
    , icon = Nothing
    , label = label
    }


view : Option -> Element Styles Variation msg
view { color, textColor, icon, label } =
    button Button
        [ vary
            (BGColor
                (Maybe.withDefault
                    { hue = Mono, shade = Lighten1 }
                    color
                )
            )
            True
        , vary
            (TextColor
                (Maybe.withDefault
                    { hue = Mono, shade = Darken2 }
                    textColor
                )
            )
            True
        ]
    <|
        row None
            [ spacing 5, padding 5, verticalCenter ]
            [ icon
                |> Maybe.map (\icon -> Icon.view icon [])
                |> Maybe.withDefault empty
            , Text.text Regular Small label
            ]