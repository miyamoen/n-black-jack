module View.Atom.Button.Bet exposing (Config, view)

import Types.Styles exposing (..)
import Types.Styles.Clickable exposing (..)
import View.Atom.Clickable as Clickable
import View.Atom.Icon.Bet as Bet


type alias Config a =
    Bet.Config a


view : Config a -> State -> RootElement msg
view config state =
    Clickable.view { bgPallet = Nothing } state <|
        Bet.view config
