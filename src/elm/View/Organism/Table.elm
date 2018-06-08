module View.Organism.Table exposing (view)

import Element exposing (..)
import Element.Attributes exposing (..)
import Styles.Types as Styles exposing (..)
import Types exposing (..)
import View.Atom.TableText as TableText
import View.Organism.Bases as Bases
import View.Organism.DealerField as DealerField


view : Table -> Element Styles Variation msg
view ({ id, betLimit, dealer, me, bases, phase } as table) =
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
        , Bases.view table
        ]
