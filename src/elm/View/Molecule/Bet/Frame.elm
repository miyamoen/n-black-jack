module View.Molecule.Bet.Frame exposing (Data, view)

import Color.Pallet exposing (..)
import Element exposing (..)
import Element.Attributes exposing (..)
import FontAwesome as FA
import PushableData as PD exposing (PushableData)
import Types.Firebase as Firebase
import Types.Styles exposing (..)
import Types.Styles.Bet exposing (State(..))
import Types.Styles.Text exposing (Size(..))
import View.Atom.Icon as Icon
import View.Molecule.Bet.Circle as Circle


type alias Data a =
    { a | chip : PushableData Int Firebase.Error }


view : State -> Data a -> RootElement msg
view state { chip } =
    Circle.view
        (if state == Open then
            Just <| PD.local chip
         else if PD.isProcessing chip then
            PD.processValue chip
         else if PD.isError chip then
            PD.failedValue chip
         else
            PD.remote chip
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
                else if PD.isProcessing chip then
                    Icon.view
                        { pallet = Pallet Orange Lighten1
                        , options = [ FA.Animation FA.Pulse ]
                        , size = Normal
                        }
                        FA.spinner
                else if PD.isError chip then
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
