module View.Molecule.Bet.Frame exposing (Data, view)

import Color.Pallet exposing (..)
import Element exposing (..)
import Element.Attributes exposing (..)
import FontAwesome as FA
import Types.Firebase as Firebase
import Types.Styles exposing (..)
import Types.Styles.Bet exposing (State(..))
import Types.Styles.Text exposing (Size(..))
import UpdatableData as UD exposing (UpdatableData)
import View.Atom.Icon as Icon
import View.Molecule.Bet.Circle as Circle


type alias Data a =
    { a | chip : UpdatableData Int Firebase.Error }


view : State -> Data a -> RootElement msg
view state { chip } =
    Circle.view
        (if state == Open then
            Just <| UD.local chip
         else if UD.isProcessing chip then
            UD.processValue chip
         else if UD.isError chip then
            UD.failedValue chip
         else
            UD.remote chip
        )
        |> onLeft
            [ el None [ moveUp 10 ] <|
                if state == Open then
                    Icon.view
                        { pallet = Pallet Green Lighten1
                        , options = []
                        , size = Normal
                        }
                        FA.edit
                else if UD.isProcessing chip then
                    Icon.view
                        { pallet = Pallet Orange Lighten1
                        , options = [ FA.Animation FA.Pulse ]
                        , size = Normal
                        }
                        FA.spinner
                else if UD.isError chip then
                    Icon.view
                        { pallet = Pallet Red Lighten1
                        , options = []
                        , size = Normal
                        }
                        FA.exclamationSquare
                else
                    Icon.view
                        { pallet = Pallet Green Lighten1
                        , options = []
                        , size = Normal
                        }
                        FA.checkCircle
            ]
