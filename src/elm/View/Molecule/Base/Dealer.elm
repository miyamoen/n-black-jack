module View.Molecule.Base.Dealer exposing (Data, view)

import Color.Pallet exposing (..)
import Element exposing (..)
import Element.Attributes exposing (..)
import Types exposing (Card, Point(..))
import Types.Styles exposing (..)
import Types.Styles.Frame exposing (..)
import Types.Styles.Text exposing (..)
import View.Atom.Text as Text
import View.Atom.Text.Point as Point
import View.Molecule.Cards.Dealer as Cards


type alias Data a =
    { a | cards : List Card }


view : Data a -> RootElement msg
view { cards } =
    column Frame
        [ vary (FrameVar <| ShapeVar Semicircle) True
        , if List.isEmpty cards then
            vary (ShadeVar Darken1) True
          else
            vary (ShadeVar Lighten2) True
        , width <| px 400
        , height <| px 200
        , center
        , alignTop
        ]
        [ Cards.view cards
        , Point.view textConfig cards
        ]


textConfig : Text.Config {}
textConfig =
    { style = Regular
    , size = Medium
    , line = OneLine
    , align = Center
    , pallet = Just <| Pallet Orange Lighten1
    , onTable = True
    }
