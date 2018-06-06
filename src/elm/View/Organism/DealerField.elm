module View.Organism.DealerField exposing (view)

import Element exposing (..)
import Element.Attributes exposing (..)
import Styles.Types exposing (..)
import Types exposing (Dealer, Point(..))
import View.Atom.PointLabel as PointLabel exposing (pointLabelDefault)
import View.Molecule.DealerHand as DealerHand


view : Dealer -> Element Styles Variation msg
view { cards } =
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
                    [ DealerHand.view cards
                    , if List.isEmpty cards then
                        empty
                      else
                        PointLabel.view pointLabelDefault cards
                    ]
            ]
