module View.Atom.Button.Close exposing (Config, view)

import Types.Styles exposing (..)
import Types.Styles.Clickable exposing (..)
import View.Atom.Clickable as Clickable
import View.Atom.Icon.Close as Close


type alias Config a =
    Close.Config a


view : Config a -> State -> RootElement msg
view config state =
    Clickable.view { bgPallet = Nothing } state <|
        Close.view config
