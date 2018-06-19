module Color.Convert exposing (colorToCssRgba)

import Color exposing (Color)


colorToCssRgba : Color -> String
colorToCssRgba cl =
    let
        { red, green, blue, alpha } =
            Color.toRgb cl
    in
    cssColorString "rgba"
        [ toString red
        , toString green
        , toString blue
        , toString alpha
        ]


cssColorString : String -> List String -> String
cssColorString kind values =
    kind ++ "(" ++ String.join ", " values ++ ")"
