module View.Symbol.Card exposing (symbols)

import List.Extra exposing (lift2)
import Svg exposing (..)
import Svg.Attributes exposing (cx, cy, d, fill, height, r, rx, stroke, strokeWidth, transform, viewBox, width, x, xlinkHref, y)
import Types.Card as Types exposing (Face(..), Number(..), Suit(..))
import View.Symbol as Symbol exposing (Symbol(Card))


symbols : List (Svg msg)
symbols =
    [ outline
    , jackMark
    , queenMark
    , kingMark
    , faceDown
    ]
        ++ List.map rank Types.numbers
        ++ List.map suitMark Types.suits
        ++ List.map outlineOf Types.suits
        ++ lift2 card Types.suits Types.numbers


type Piece
    = Outline
    | OutlineOf Suit
    | Rank Number
    | SuitMark Suit
    | JackMark
    | QueenMark
    | KingMark


id : Piece -> Attribute msg
id piece =
    Svg.Attributes.id <| id_ piece


id_ : Piece -> String
id_ piece =
    case piece of
        Outline ->
            "svg-card-outline"

        Rank num ->
            "svg-card-rank-" ++ rankText num

        SuitMark suit ->
            "svg-card-suit-mark-" ++ toString suit

        JackMark ->
            "svg-card-suit-mark-jack"

        QueenMark ->
            "svg-card-suit-mark-queen"

        KingMark ->
            "svg-card-suit-mark-king"

        OutlineOf suit ->
            "svg-card-outline-of-" ++ toString suit


xlinkHref : Piece -> Attribute msg
xlinkHref piece =
    Svg.Attributes.xlinkHref <| "#" ++ id_ piece


use : Piece -> Svg msg
use piece =
    Svg.use [ xlinkHref piece ] []


rankText : Number -> String
rankText number =
    case number of
        Ace ->
            "A"

        Two ->
            "2"

        Three ->
            "3"

        Four ->
            "4"

        Five ->
            "5"

        Six ->
            "6"

        Seven ->
            "7"

        Eight ->
            "8"

        Nine ->
            "9"

        Ten ->
            "10"

        Jack ->
            "J"

        Queen ->
            "Q"

        King ->
            "K"


viewBox : Attribute msg
viewBox =
    Svg.Attributes.viewBox "0 0 72 110"


outline : Svg msg
outline =
    Svg.symbol
        [ viewBox
        , id Outline
        ]
        [ rect
            [ width "72"
            , height "110"
            , rx "6"
            , fill "rgb(250, 250, 250)"
            , stroke "black"
            , strokeWidth ".5"
            ]
            []
        ]


rank : Number -> Svg msg
rank number =
    Svg.symbol [ viewBox, id <| Rank number ]
        [ text_ [ x "2", y "15" ]
            [ text <| rankText number ]
        , text_ [ x "2", y "15", transform "rotate(180,36,55)" ]
            [ text <| rankText number ]
        ]


suitMark : Suit -> Svg msg
suitMark suit =
    Svg.symbol [ viewBox, id <| SuitMark suit ]
        [ case suit of
            Spade ->
                path [ d "M 8.7382856,16 h -4.290057 v -0.105371 c 0.9494857,-1.142858 1.3010285,-2.303543 1.5824,-4.765029 H 5.9252571 C 5.3801143,12.307657 4.3426286,12.800229 3.2528,12.800229 1.1430857,12.800229 0,11.3056 0,9.2484572 0,7.472457 1.7933714,5.397714 2.8662857,4.167086 4.0969143,2.760457 5.7142857,0.931886 6.5757714,0 h 0.0352 c 0.8614857,0.931886 2.4790862,2.760457 3.7099426,4.167086 1.072229,1.230628 2.865829,3.305371 2.865829,5.0813712 0,2.0571428 -1.142629,3.5517718 -3.2525714,3.5517718 -1.090057,0 -2.127543,-0.492343 -2.6722287,-1.670629 h -0.1056 c 0.2811428,2.461714 0.6331428,3.622171 1.5821717,4.765029 V 16 z" ] []

            Heart ->
                path [ d "M 6.6448,2.994057 C 7.192,0.978743 8.5837716,0 10.058971,0 c 1.773486,0 3.197943,1.650286 3.197943,3.857371 0,2.571429 -1.209143,4.452572 -2.452343,6.198629 -1.1924564,1.669714 -3.5460567,4.548343 -4.1595424,5.258286 H 6.6118857 C 5.9986286,14.604343 3.6459429,11.725714 2.4523429,10.056 1.2093714,8.309943 0,6.4288 0,3.857371 0,1.650286 1.4256,0 3.1984,0 4.6729143,0 6.0649143,0.978743 6.6121143,2.994057 h 0.032686 z" ] []

            Club ->
                path [ d "M 5.2157714,5.882057 C 4.7718857,5.271543 4.328,4.494857 4.328,3.458743 4.328,1.461029 5.9186286,0 7.8610286,0 c 1.9792,0 3.5330284,1.498286 3.5330284,3.458743 0,1.035886 -0.443886,1.812571 -0.888,2.423314 l 0.09257,0.09257 c 0.536457,-0.388343 1.3504,-0.647543 1.831314,-0.647543 1.9424,0 3.2928,1.701714 3.2928,3.5515432 0,2.0347418 -1.572343,3.6070848 -3.551772,3.6070848 -1.072685,0 -2.5897134,-0.610514 -3.6438854,-2.182857 h -0.074055 c 0.258971,3.162974 0.666286,4.383774 1.6649144,5.586288 V 16 H 5.6045714 V 15.889143 C 6.6034286,14.686629 7.0105143,13.465829 7.2694857,10.302857 H 7.1954286 C 6.1408,11.874971 4.6242286,12.485714 3.5515429,12.485714 1.5721143,12.485714 0,10.913371 0,8.8786292 0,7.0288 1.3501714,5.327086 3.2925714,5.327086 c 0.4809143,0 1.2946286,0.2592 1.8310857,0.647543 l 0.092114,-0.09257 z" ] []

            Diamond ->
                path [ d "M 11.6592,8 5.8212571,16 0,8 5.8212571,0 11.6592,8 z" ] []
        ]


jackMark : Svg msg
jackMark =
    Svg.symbol [ viewBox, id JackMark ]
        [ path [ d "m 0.461668,32.107515 c 0,0 2.686087,0.671517 5.372157,0.671517 0.58758,0 1.17514,-0.04196 1.72076,-0.126486 0.71349,-0.545609 1.8047,-2.266372 2.30833,-5.372142 0.71351,-4.364865 3.60943,-24.594334 3.60943,-24.594334 L 9.233385,1.804703 C 9.233385,1.301064 9.485195,0.377729 9.778975,0 h 11.66761 l -0.46165,2.181849 -3.69334,0.420282 c 0,0 -2.68607,18.634614 -3.81925,24.258575 -1.21715,6.421388 -3.73532,8.897609 -7.97429,8.897609 -2.77001,0 -4.40684,-0.881367 -5.498055,-2.098492 l 0.461668,-1.552302 z" ] [] ]


queenMark : Svg msg
queenMark =
    Svg.symbol [ viewBox, id QueenMark ]
        [ path [ d "m 29.617505,30.215686 c -0.84568,1.514307 -2.1839,2.817314 -5.88163,2.817314 -4.57764,0 -11.83222,-4.155537 -16.023475,-8.311074 C 2.18294,24.721926 0,20.953769 0,15.389575 0,7.606746 4.71901,0 12.290045,0 c 5.52948,0 7.74859,3.73294 7.74859,9.332351 0,6.726336 -3.55734,13.347023 -9.40327,15.002194 6.79678,4.120321 11.65664,5.635116 14.89606,5.635116 1.69088,0 2.88775,-0.316948 3.87381,-0.599169 l 0.21227,0.845194 z M 10.740525,2.746881 c -5.528485,0 -7.782825,6.726335 -7.782825,11.234037 0,4.402052 1.69087,7.994127 6.30422,7.994127 5.529475,0 7.782845,-6.69112 7.782845,-11.234037 0,-4.402053 -1.68991,-7.994127 -6.30424,-7.994127 z" ] [] ]


kingMark : Svg msg
kingMark =
    Svg.symbol [ viewBox, id KingMark ]
        [ path [ d "M 0.44567,28.254932 4.54576,27.408794 8.06647,2.852233 4.01096,1.916344 C 4.01096,1.381551 4.27834,0.401094 4.59032,0 h 11.943725 l -0.49023,2.316821 -3.92183,0.446281 -3.832685,24.734206 4.367485,0.311964 c 0,0.668493 -0.31196,1.916962 -0.75764,2.495704 H 0 l 0.44567,-2.050044 z m 26.338565,1.916964 c -0.57936,0.445662 -1.20328,0.935889 -3.20873,0.935889 -1.82723,0 -3.38705,-1.069588 -5.25883,-3.476159 -1.38155,-1.871159 -4.72399,-7.263661 -6.64035,-10.383292 -0.84675,-1.38155 -1.15872,-2.719153 -1.15872,-2.719153 l 13.0579,-11.676329 -3.8327,-0.935889 c 0,-0.534793 0.26738,-1.515249 0.57934,-1.916344 h 11.05244 l -0.49025,2.316821 -2.85224,0.490845 -13.36984,11.408934 c 1.69351,3.119627 6.19468,9.403455 7.84364,11.275233 1.51525,1.738698 3.1642,3.342459 4.27834,4.189836 v 0.489608 z" ] [] ]


outlineOf : Suit -> Svg msg
outlineOf suit =
    Svg.symbol [ viewBox, id <| OutlineOf suit ]
        [ use Outline
        , Svg.use
            [ x "5"
            , y "35"
            , transform "scale(.5)"
            , xlinkHref <| SuitMark suit
            ]
            []
        , Svg.use
            [ x "5"
            , y "35"
            , transform "rotate(180,36,55) scale(.5)"
            , xlinkHref <| SuitMark suit
            ]
            []
        ]


card : Suit -> Number -> Svg msg
card suit number =
    cardSymbol suit number <|
        mark suit number


cardSymbol : Suit -> Number -> List (Svg msg) -> Svg msg
cardSymbol suit number contents =
    Svg.symbol
        [ viewBox, Symbol.id <| Card { suit = suit, number = number, face = Up } ]
        ([ use <| OutlineOf suit
         , use <| Rank number
         ]
            ++ contents
        )


mark : Suit -> Number -> List (Svg msg)
mark suit number =
    let
        ( left, center, right ) =
            positions suit
    in
    if suit == Spade && number == Ace then
        [ Svg.use
            [ x "12"
            , y "20"
            , transform "scale(2)"
            , xlinkHref <| SuitMark suit
            ]
            []
        ]
    else
        case number of
            Ace ->
                [ useXY center 47 False suit ]

            Two ->
                [ useXY center 16 False suit
                , useXY center 16 True suit
                ]

            Three ->
                useXY center 47 False suit :: mark suit Two

            Four ->
                [ useXY left 16 False suit
                , useXY right 16 False suit
                , useXY left 16 True suit
                , useXY right 16 True suit
                ]

            Five ->
                useXY center 47 False suit
                    :: mark suit Four

            Six ->
                [ useXY left 47 False suit
                , useXY right 47 False suit
                ]
                    ++ mark suit Four

            Seven ->
                useXY center 32 False suit
                    :: mark suit Six

            Eight ->
                [ useXY left 36 False suit
                , useXY right 36 False suit
                , useXY left 36 True suit
                , useXY right 36 True suit
                ]
                    ++ mark suit Four

            Nine ->
                useXY center 47 False suit
                    :: mark suit Eight

            Ten ->
                [ useXY center 27 False suit
                , useXY center 27 True suit
                ]
                    ++ mark suit Eight

            Jack ->
                [ Svg.use
                    [ xlinkHref JackMark, x "16", y "18" ]
                    []
                , Svg.use
                    [ xlinkHref JackMark, x "16", y "18", transform "rotate(180,36,55)" ]
                    []
                ]

            Queen ->
                [ Svg.use
                    [ xlinkHref QueenMark, x "20", y "18" ]
                    []
                , Svg.use
                    [ xlinkHref QueenMark, x "20", y "18", transform "rotate(180,36,55)" ]
                    []
                ]

            King ->
                [ Svg.use
                    [ xlinkHref KingMark, x "20", y "18" ]
                    []
                , Svg.use
                    [ xlinkHref KingMark, x "20", y "18", transform "rotate(180,36,55)" ]
                    []
                ]


positions : Suit -> ( number, number, number )
positions suit =
    case suit of
        Spade ->
            ( 14, 29, 44 )

        Heart ->
            ( 14, 29, 44 )

        Club ->
            ( 13, 28, 43 )

        Diamond ->
            ( 15, 30, 45 )


useXY : number -> number -> Bool -> Suit -> Svg msg
useXY x_ y_ isRotate suit =
    Svg.use
        ([ xlinkHref <| SuitMark suit
         , x <| toString x_
         , y <| toString y_
         ]
            ++ (if isRotate then
                    [ transform "rotate(180,36,55)" ]
                else
                    []
               )
        )
        []


faceDown : Svg msg
faceDown =
    Svg.symbol
        [ viewBox
        , Symbol.id <|
            Card { suit = Spade, number = Ace, face = Down }
        , fill "rgb(80, 112, 161)"
        ]
        (use Outline
            :: lift2
                (\x y -> useXY x y False Diamond)
                (List.range 0 5 |> List.map (\i -> 2.0448 / 2 + 11.6592 * toFloat i))
                (List.range 0 5 |> List.map (\i -> 7 + 16 * toFloat i))
        )
