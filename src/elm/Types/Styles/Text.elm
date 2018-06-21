module Types.Styles.Text exposing (..)


type Variation
    = StyleVar FontStyle
    | SizeVar Size
    | AlignVar Align


type FontStyle
    = Regular
    | RegularItaric
    | Bold
    | BoldItaric


fontStyles : List FontStyle
fontStyles =
    [ Regular, RegularItaric, Bold, BoldItaric ]


type Size
    = Huge
    | Large
    | Medium
    | Small
    | Tiny


sizes : List Size
sizes =
    [ Huge, Large, Medium, Small, Tiny ]


type Align
    = Left
    | Center
    | Right


aligns : List Align
aligns =
    [ Left, Center, Right ]


type Line
    = OneLine
    | MultiLine


lines : List Line
lines =
    [ OneLine, MultiLine ]
