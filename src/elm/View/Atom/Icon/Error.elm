module View.Atom.Icon.Error exposing (view)

import Color.Pallet exposing (..)
import FontAwesome as FA
import Types.Styles exposing (..)
import Types.Styles.Text exposing (Size(..))
import View.Atom.Icon as Icon


type alias Config a =
    { a | size : Size }


view : Config a -> RootElement msg
view { size } =
    Icon.view
        { pallet = Pallet Red Lighten1
        , options = []
        , size = size
        }
        FA.exclamationSquare
