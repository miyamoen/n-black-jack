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
        , size : Size
        , boxSize : Length
    }


view : Config a -> State -> String -> RootElement msg
view { hue, size, boxSize } state label =
    node "button" <|
        row (Selector state)
            [ width boxSize
            , height boxSize
            , verticalCenter
            , center
            , vary (HueVar hue) True
            ]
            [ Text.view (textConfig size) label ]


textConfig : Size -> Text.Config {}
textConfig size =
    { style = RegularItaric
    , size = size
    , line = OneLine
    , align = Center
    , pallet = Nothing
    , onTable = False
    }
