module View.Atom.ActionButton exposing (Option, default, view)

import Colors exposing (Colors, Hue(..), Shade(..))
import Element exposing (..)
import Element.Attributes exposing (..)
import FontAwesome exposing (Icon)
import Styles.Types exposing (..)
import View.Atom.Icon as Icon
import View.Atom.Text as Text


type alias Option =
    { hue : Hue
    , label : String
    , state : State
    }


default : Option
default =
    { hue = Orange
    , label = ""
    , state = Active
    }


view : Option -> Element Styles Variation msg
view { hue, state, label } =
    node "button" <|
        row (ActionButton state)
            [ width <| px 100
            , height <| px 100
            , padding 10
            , verticalCenter
            , center
            , vary (HueVar hue) True
            ]
            [ el (Label RegularItaric Medium) [] <|
                text label
            ]


labelOption : Text.Option
labelOption =
    Text.default
