module Styles.TableText exposing (styles)

import Style exposing (..)
import Style.Filter as Filter
import Types.Styles exposing (..)


styles : Style Styles Variation
styles =
    style TableText
        [ Filter.opacity 80 ]
