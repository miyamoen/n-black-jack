module View.Atom.Text exposing (Config, view)

import Color.Pallet exposing (Pallet)
import Element exposing (..)
import Element.Attributes exposing (alignLeft, spacing, vary)
import Element.Utils exposing (maybeVary)
import Types.Styles as Root exposing (..)
import Types.Styles.Text exposing (..)


type alias Config a =
    { a
        | style : FontStyle
        , size : Size
        , align : Align
        , line : Line
        , pallet : Maybe Pallet
        , onTable : Bool
    }


view : Config a -> String -> RootElement msg
view ({ line } as config) data =
    case line of
        OneLine ->
            el Text (variations config) <|
                text data

        MultiLine ->
            paragraph Text
                (variations config)
                [ text data ]


variations :
    { a | align : Align, pallet : Maybe Pallet, size : Size, style : FontStyle, onTable : Bool }
    -> List (Attribute Root.Variation msg)
variations { style, size, align, pallet, onTable } =
    [ vary (TextVar <| StyleVar style) True
    , vary (TextVar <| SizeVar size) True
    , vary (TextVar <| AlignVar align) True
    , maybeVary PalletVar pallet
    , vary (TextVar OnTable) onTable
    ]
