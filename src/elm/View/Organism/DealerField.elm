module View.Organism.DealerField exposing (view)

import Element exposing (..)
import Element.Attributes exposing (..)
import Styles.Types exposing (..)
import Types exposing (Card, Point(..))
import View.Atom.Card as Card
import View.Atom.PointLabel as PointLabel exposing (pointLabelDefault)


view : List Card -> Element Styles Variation msg
view cards =
    el Frame
        [ vary (ShapeVar Semicircle) True
        , width <| px 400
        , height <| px 200
        ]
        empty
        |> within
            [ el None [ center, alignTop ] <|
                column None
                    [ center
                    , width <| px 200
                    , height <| px 160
                    , verticalSpread
                    ]
                    [ align cards
                    , if List.isEmpty cards then
                        empty
                      else
                        PointLabel.view pointLabelDefault cards
                    ]
            ]


align : List Card -> Element Styles Variation msg
align cards =
    el None [ width <| px 72, height <| px 110 ] empty
        |> within
            (case cards of
                hole :: up :: [] ->
                    [ el None [ moveRight -41 ] <| Card.view up
                    , el None [ moveRight 41 ] <| Card.view hole
                    ]

                _ ->
                    List.reverse cards
                        |> List.indexedMap
                            (\index card ->
                                el None [ moveRight <| -41 + 41 * toFloat index ] <|
                                    Card.view card
                            )
            )
