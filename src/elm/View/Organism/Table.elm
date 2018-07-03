module View.Organism.Table exposing (view)

import Element exposing (..)
import Element.Attributes exposing (..)
import Types exposing (..)
import Types.Styles as Styles exposing (..)
import View.Molecule.Table.Box.Dealer as DealerBox
import View.Molecule.Text.TableRule as TableRule
import View.Organism.Table.Bases as Bases


view : Table -> Element Styles Variation msg
view ({ id, betLimit, dealer, me, bases, phase } as table) =
    column Board
        [ center
        , alignTop
        , width fill
        , height fill
        , spacing 30
        , padding 30
        ]
        [ DealerBox.view dealer
        , TableRule.view phase
        , Bases.view table
        ]
