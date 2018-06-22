module View.Atom.Text.OnTable exposing (Config, textConfig, view)

import Color.Pallet exposing (..)
import Types.Styles exposing (..)
import Types.Styles.Text exposing (..)
import View.Atom.Text as Text


type alias Config a =
    { a | size : Size, line : Line, align : Align }


view : Config a -> String -> RootElement msg
view config text =
    Text.view (textConfig config) text


textConfig : Config a -> Text.Config {}
textConfig { size, line, align } =
    { style = BoldItaric
    , size = size
    , line = line
    , align = align
    , pallet = Pallet Orange Lighten1
    , onTable = True
    }
