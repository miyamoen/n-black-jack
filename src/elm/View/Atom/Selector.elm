module View.Atom.Selector exposing (Config, view)

import Color.Pallet exposing (..)
import Element exposing (..)
import Element.Attributes exposing (..)
import Types.Styles exposing (..)
import Types.Styles.Selector exposing (..)
import Types.Styles.Text exposing (..)
import View.Atom.Text as Text


type alias Config a =
    { a
        | hue : Hue
    }


view : Config a -> State -> String -> RootElement msg
view { hue } state label =
    node "button" <|
        row (Selector state)
            [ width <| px 100
            , height <| px 100
            , padding 10
            , verticalCenter
            , center
            , vary (HueVar hue) True
            ]
            [ Text.view textConfig label ]


textConfig : Text.Config {}
textConfig =
    { style = RegularItaric
    , size = Medium
    , line = OneLine
    , align = Center
    , pallet = Nothing
    , onTable = False
    }
