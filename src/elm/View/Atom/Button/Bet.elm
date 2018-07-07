module View.Atom.Button.Bet exposing (Config, view)

import Types.Styles exposing (..)
import Types.Styles.Clickable exposing (..)
import View.Atom.Clickable as Clickable
import View.Atom.Icon.Bet as Icon


type alias Config a =
    Icon.Config a


view : Config a -> State -> RootElement msg
view config state =
    Clickable.view { bgPallet = Nothing } state <|
        Icon.view config
