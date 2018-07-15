module View.Molecule.Hands.Board exposing (Data, view)

import Color.Pallet exposing (Hue(Orange))
import Element exposing (..)
import Element.Attributes exposing (..)
import PushableData exposing (PushableData(..))
import Types exposing (Action(..))
import Types.Firebase as Firebase
import Types.Styles exposing (..)
import View.Molecule.Hands.Selector as Selector


type alias Data a =
    { a | action : PushableData Action Firebase.Error }


view : Data a -> RootElement msg
view { action } =
    row Board
        [ vary (HueVar Orange) True
        , spacing 20
        , paddingXY 10 5
        ]
        [ Selector.view { target = Stand, action = action }
        , Selector.view { target = Hit, action = action }
        ]
