module View.Molecule.Betting.ResetButton exposing (Data, view)

import Color.Pallet exposing (..)
import FontAwesome as FA
import PushableData as PD exposing (PushableData)
import Types.Firebase as Firebase
import Types.Styles exposing (..)
import Types.Styles.Button exposing (..)
import Types.Styles.Text exposing (..)
import View.Atom.Button.WithLabel as Button


type alias Data a =
    { a | betting : PushableData Int Firebase.Error }


view : Data a -> RootElement msg
view data =
    Button.view buttonConfig (state data) (label data)


label : Data a -> String
label { betting } =
    PD.resetValue betting
        |> Maybe.map (\value -> "Reset to " ++ toString value)
        |> Maybe.withDefault "Reset"


state : Data a -> State
state { betting } =
    if PD.isResetable betting then
        Enable
    else
        Disable


buttonConfig : Button.Config {}
buttonConfig =
    { bgPallet = Just <| Pallet Blue Lighten2
    , icon = Just <| FA.redo
    , pallet = Just <| White
    , size = Tiny
    , style = Regular
    }
