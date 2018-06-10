module View.Atom.TableText exposing (Option, view)

import Colors exposing (..)
import Element exposing (..)
import Styles.Types exposing (..)
import View.Atom.Text as Text


type alias Option =
    { size : FontSize }


view : Option -> String -> Element Styles Variation msg
view { size } text =
    el TableText [] <|
        Text.label
            { size = size
            , style = BoldItaric
            , color = Colors Orange Lighten1
            }
            text
