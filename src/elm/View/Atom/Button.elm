module View.Atom.Button exposing (Option, default, view)

import Colors exposing (Colors, Hue(..), Shade(..))
import Element exposing (..)
import Element.Attributes exposing (..)
import FontAwesome exposing (Icon)
import Styles.Types exposing (..)
import View.Atom.Icon as Icon


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
    node "button" <|
        row Button
            [ spacing 10
            , padding 10
            , verticalCenter
            , background color
            , text textColor
            ]
            [ icon
                |> Maybe.map (\icon -> Icon.view icon [])
                |> Maybe.withDefault empty
            , el (Label Regular Small) [] <|
                Element.text label
            ]


background : Maybe Colors -> Attribute Variation msg
background color =
    vary
        (BGColor
            (Maybe.withDefault
                { hue = Mono, shade = Lighten1 }
                color
            )
        )
        True


text : Maybe Colors -> Attribute Variation msg
text color =
    vary
        (TextColor
            (Maybe.withDefault
                { hue = Mono, shade = Darken2 }
                color
            )
        )
        True
