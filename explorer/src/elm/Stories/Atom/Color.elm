module Stories.Atom.Color exposing (viewStories)

import Color exposing (Color)
import Color.Chip as Chip
import Color.Convert exposing (colorToCssRgba)
import Color.Pallet as Pallet exposing (..)
import Element exposing (..)
import Element.Attributes exposing (height, inlineStyle, px, vary, width)
import Rocket exposing ((=>))
import Stories.Element exposing (toMain)
import Types.Styles exposing (Styles(..), Variation(..))
import UIExplorer exposing (renderStories)


type Pallets
    = Pallet
    | Mono
    | Chip


view : Pallets -> Element Styles variation msg
view pallets =
    case pallets of
        Pallet ->
            pallet

        Mono ->
            row None [] <|
                (colorBox <| Pallet.color Black)
                    :: List.map
                        (\shade -> colorBox <| Pallet.color_ Pallet.Mono shade)
                        shades
                    ++ [ colorBox <| Pallet.color White ]

        Chip ->
            row None [] <|
                List.map (Chip.color >> colorBox) Chip.pallets


colorBox : Color -> Element Styles variation msg
colorBox color =
    el None
        [ width <| px 50
        , height <| px 50
        , inlineStyle [ "background-color" => colorToCssRgba color ]
        ]
        empty


pallet : Element Styles variation msg
pallet =
    column None [] <|
        List.map
            (\hue ->
                row None [] <|
                    List.map
                        (\shade -> colorBox <| Pallet.color_ hue shade)
                        shades
            )
            hues


stories : List ( String, Pallets )
stories =
    [ "Pallet" => Pallet
    , "Mono" => Mono
    , "Chip" => Chip
    ]


viewStories =
    renderStories (view >> Stories.Element.toHtml) stories


main =
    toMain viewStories
