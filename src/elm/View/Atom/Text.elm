module View.Atom.Text exposing (Config, view)

import Color.Pallet exposing (Pallet)
import Element exposing (..)
import Element.Attributes exposing (alignLeft, spacing, vary)
import Types.Styles as Root exposing (..)
import Types.Styles.Text exposing (..)


type alias Config a =
    { a
        | style : FontStyle
        , size : Size
        , align : Align
        , line : Line
        , pallet : Pallet
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
    { a | align : Align, pallet : Pallet, size : Size, style : FontStyle }
    -> List (Attribute Root.Variation msg)
variations { style, size, align, pallet } =
    [ vary (TextVar <| StyleVar style) True
    , vary (TextVar <| SizeVar size) True
    , vary (TextVar <| AlignVar align) True
    , vary (PalletVar pallet) True
    ]
