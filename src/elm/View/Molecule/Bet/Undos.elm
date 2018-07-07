module View.Molecule.Bet.Undos exposing (Config, view)

import Color.Pallet exposing (..)
import Element exposing (..)
import Element.Attributes exposing (..)
import Types.Styles exposing (..)
import Types.Styles.Clickable exposing (State(Enable))
import Types.Styles.Text exposing (..)
import View.Atom.Button as Button
import View.Atom.Icon.Undo as Icon


type alias Config a =
    { a | size : Size }


view : Config a -> List Int -> RootElement msg
view { size } values =
    row None [ verticalCenter, spacing 10 ] <|
        Icon.view (iconConfig size)
            :: List.map (toString >> Button.view (buttonConfig size) Enable) values


iconConfig : Size -> Icon.Config {}
iconConfig size =
    { size = size
    , pallet = Pallet Orange Main
    }


buttonConfig : Size -> Button.Config {}
buttonConfig size =
    { bgPallet = Just <| Pallet Orange Main
    , icon = Nothing
    , pallet = Just White
    , size = size
    , style = Regular
    }
