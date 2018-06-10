module View.Atom.ChipButton exposing (Option, chipButtonDefault, view)

import Element exposing (..)
import Styles.Types exposing (..)
import View.Atom.Chip as Chip


type alias Option =
    { state : State }


{-| ChipButton State is Active or Inactive.
-}
chipButtonDefault : Option
chipButtonDefault =
    { state = Active }


view : Option -> Int -> Element Styles Variation msg
view { state } chip =
    el (ChipButton state) [] <|
        Chip.view chip
