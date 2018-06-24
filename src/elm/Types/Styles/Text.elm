module Types.Styles.Text
    exposing
        ( Align(..)
        , FontStyle(..)
        , Line(..)
        , Size(..)
        , Variation(..)
        , aligns
        , fontStyles
        , lines
        , sizes
        )


type Variation
    = StyleVar FontStyle
    | SizeVar Size
    | AlignVar Align
    | OnTable


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
    | Normal
    | Small
    | Tiny


sizes : List Size
sizes =
    [ Huge, Large, Medium, Normal, Small, Tiny ]


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
