module View.Molecule.Betting.CheckButton exposing (Data, view)

import Color.Pallet exposing (..)
import FontAwesome as FA
import PushableData as PD exposing (PushableData)
import Types.Firebase as Firebase
import Types.Styles exposing (..)
import Types.Styles.Clickable exposing (..)
import Types.Styles.Text exposing (..)
import View.Atom.Button.WithLabel as Button


type alias Data a =
    { a | betting : PushableData Int Firebase.Error }


view : Data a -> RootElement msg
view data =
    Button.view buttonConfig (state data) ""


state : Data a -> State
state { betting } =
    if PD.isPushable betting then
        Enable
    else
        Disable


buttonConfig : Button.Config {}
buttonConfig =
    { bgPallet = Just White
    , icon = Just <| FA.checkCircle
    , pallet = Just <| Pallet Green Lighten2
    , size = Normal
    , style = Regular
    }
