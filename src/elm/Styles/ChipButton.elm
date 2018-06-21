module Styles.ChipButton exposing (styles)

import Color exposing (rgba)
import Style exposing (..)
import Style.Filter as Filter
import Style.Shadow as Shadow
import Style.Sheet exposing (mix)
import Style.Transition as Transition
import Types.Styles exposing (..)


styles : Style Styles Variation
styles =
    mix
        [ style (ChipButton Active)
            [ cursor "pointer"
            , translate 0 -3 0
            , Shadow.drop
                { offset = ( 0, 3 )
                , blur = 2
                , color = Color.rgba 0 0 0 0.6
                }
            , Transition.performant
            , pseudo "hover"
                [ translate 0 -5 0
                , Shadow.drop
                    { offset = ( 0, 5 )
                    , blur = 2
                    , color = Color.rgba 0 0 0 0.6
                    }
                ]
            , pseudo "active"
                [ translate 0 0 0
                , Shadow.drop
                    { offset = ( 0, 0 )
                    , blur = 0.5
                    , color = Color.rgba 0 0 0 0.6
                    }
                ]
            ]
        , style (ChipButton Inactive)
            [ Filter.grayscale 80
            , Filter.brightness 80
            ]
        ]