module View.Atom.Text.OnTable exposing (Config, view)

import Color.Pallet exposing (..)
import Types.Styles exposing (..)
import Types.Styles.Text exposing (..)
import View.Atom.Text as Text


type alias Config a =
    { a | size : Size, line : Line, align : Align }


view : Config a -> String -> RootElement msg
view { size, line, align } text =
    Text.view
        { style = BoldItaric
        , size = size
        , line = line
        , align = align
        , pallet = Pallet Orange Lighten1
        , onTable = True
        }
        text
