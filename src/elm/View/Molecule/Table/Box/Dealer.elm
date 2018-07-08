module View.Molecule.Table.Box.Dealer exposing (view)

import Color.Pallet exposing (..)
import Element exposing (..)
import Element.Attributes exposing (..)
import Types exposing (Dealer, Point(..))
import Types.Styles exposing (..)
import Types.Styles.Frame exposing (..)
import Types.Styles.Text exposing (..)
import View.Atom.Text as Text
import View.Molecule.Cards.Dealer as Cards
import View.Atom.Text.Point as Point


view : Dealer -> RootElement msg
view { cards } =
    el Frame
        [ vary (FrameVar <| ShapeVar Semicircle) True
        , if List.isEmpty cards then
            vary (ShadeVar Darken1) True
          else
            vary (ShadeVar Lighten2) True
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
                    [ Cards.view cards
                    , Point.view textConfig cards
                    ]
            ]


textConfig : Text.Config {}
textConfig =
    { style = BoldItaric
    , size = Medium
    , line = OneLine
    , align = Center
    , pallet = Just <| Pallet Orange Lighten1
    , onTable = True
    }
