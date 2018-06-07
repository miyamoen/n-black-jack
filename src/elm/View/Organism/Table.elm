module View.Organism.Table exposing (view)

import Element exposing (..)
import Element.Attributes exposing (..)
import Styles.Types as Styles exposing (..)
import Types exposing (..)
import View.Atom.TableText as TableText
import View.Organism.DealerField as DealerField
import View.Organism.PlayerField as PlayerField


view : Table -> Element Styles Variation msg
view { dealer, phase, first, second, third, fourth, fifth } =
    column Styles.Table
        [ center
        , alignTop
        , width fill
        , height fill
        , spacing 30
        , padding 30
        ]
        [ DealerField.view dealer
        , TableText.view phase
        , row None
            [ spacing 30, spread ]
            [ PlayerField.view first
            , PlayerField.view second
            , PlayerField.view third
            , PlayerField.view fourth
            , PlayerField.view fifth
            ]
        ]
