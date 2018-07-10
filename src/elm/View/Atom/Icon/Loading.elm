module View.Atom.Icon.Loading exposing (view)

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
        { pallet = Pallet Orange Lighten1
        , options = [ FA.Animation FA.Pulse ]
        , size = size
        }
        FA.spinner
