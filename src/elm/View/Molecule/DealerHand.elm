module View.Molecule.DealerHand exposing (view)

import Colors exposing (Hue(Orange), Shade(..))
import Element exposing (..)
import Element.Attributes exposing (..)
import Styles exposing (Styles(..), Variation(..))
import Styles.Text exposing (FontStyle(..), Size(Medium))
import Types exposing (Card, Point(..))
import Types.Card exposing (point)
import View.Atom.Card as Card
import View.Atom.PointLabel as PointLabel


view : List Card -> Element Styles Variation msg
view cards =
    column None
        [ vary
            (TextColor { shade = Lighten1, hue = Orange })
            True
        , center
        , width <| px 200
        , height <| px 160
        , verticalSpread
        ]
        [ align cards
        , if List.isEmpty cards then
            empty
          else
            PointLabel.view Medium cards
        ]


align : List Card -> Element Styles Variation msg
align cards =
    el None [ width <| px 70, height <| px 110 ] empty
        |> within
            (case cards of
                hole :: up :: [] ->
                    [ el None [ moveRight -40 ] <| Card.view up
                    , el None [ moveRight 40 ] <| Card.view hole
                    ]

                _ ->
                    List.reverse cards
                        |> List.indexedMap
                            (\index card ->
                                el None [ moveRight <| -40 + 40 * toFloat index ] <|
                                    Card.view card
                            )
            )
