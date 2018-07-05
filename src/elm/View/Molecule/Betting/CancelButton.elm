module View.Molecule.Betting.CancelButton exposing (view)

import Color.Pallet exposing (..)
import FontAwesome as FA
import Types.Styles exposing (..)
import Types.Styles.Clickable exposing (..)
import Types.Styles.Text exposing (..)
import View.Atom.Button.WithLabel as Button


view : RootElement msg
view =
    Button.view buttonConfig Enable ""


buttonConfig : Button.Config {}
buttonConfig =
    { bgPallet = Nothing
    , icon = Just <| FA.timesCircle
    , pallet = Just <| Pallet Red Main
    , size = Normal
    , style = Regular
    }
