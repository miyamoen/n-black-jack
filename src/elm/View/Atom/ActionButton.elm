module View.Atom.ActionButton exposing (Option, actionButtonDefault, view)

import Colors exposing (Colors, Hue(..), Shade(..))
import Element exposing (..)
import Element.Attributes exposing (..)
import Styles.Types exposing (..)


type alias Option =
    { hue : Hue
    , label : String
    , state : State
    }


actionButtonDefault : Option
actionButtonDefault =
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
