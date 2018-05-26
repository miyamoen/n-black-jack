module View.Atom.Button exposing (Option, default, view)

import Colors exposing (Colors, Hue(..), Shade(..))
import Element exposing (..)
import Element.Attributes exposing (..)
import FontAwesome exposing (Icon)
import Styles.Types exposing (..)
import View.Atom.Icon as Icon


type alias Option =
    { color : Colors
    , labelColor : Colors
    , icon : Maybe Icon
    }


default : Option
default =
    { color = Colors Mono Darken1
    , labelColor = Colors Mono Lighten2
    , icon = Nothing
    }


view : Option -> String -> Element Styles Variation msg
view { color, labelColor, icon } label =
    node "button" <|
        row Button
            [ spacing 10
            , padding 10
            , verticalCenter
            , vary (ColorVar color) True
            , vary (SubColorVar labelColor) True
            ]
            [ icon
                |> Maybe.map (\icon -> Icon.view icon [])
                |> Maybe.withDefault empty
            , el (Label Regular Small) [] <| text label
            ]
