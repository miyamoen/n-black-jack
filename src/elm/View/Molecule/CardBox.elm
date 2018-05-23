module View.Molecule.CardBox exposing (view)

import Colors exposing (Colors(Orange), Shade(..))
import Element exposing (..)
import Element.Attributes exposing (alignBottom, center, fill, height, vary, width)
import Styles exposing (Styles(..), Variation(..))
import Styles.Text exposing (FontStyle(..), Size(Medium))
import Types exposing (Card)
import View.Atom.CardBox as CardBox
import View.Atom.PointLabel as PointLabel
import View.Molecule.Cards as Cards exposing (Align(..))


view : List Card -> Element Styles Variation msg
view cards =
    case cards of
        [] ->
            CardBox.view Darken1 empty

        _ ->
            CardBox.view Lighten2 <|
                column None
                    [ width fill
                    , height fill
                    , alignBottom
                    , center
                    , vary (TextColor Lighten1 Orange) True
                    ]
                    [ Cards.view Slanting cards
                    , PointLabel.view Medium cards
                    ]
