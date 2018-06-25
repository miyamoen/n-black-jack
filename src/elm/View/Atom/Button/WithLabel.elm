module View.Atom.Button.WithLabel exposing (Config, view)

import Color.Pallet exposing (..)
import Element exposing (..)
import Element.Attributes exposing (..)
import FontAwesome exposing (Icon)
import Types.Styles exposing (..)
import Types.Styles.Button exposing (..)
import Types.Styles.Text exposing (..)
import View.Atom.Button as Button
import View.Atom.Icon as Icon
import View.Atom.Text as Text


type alias Config a =
    { a
        | bgPallet : Maybe Pallet
        , icon : Maybe Icon
        , pallet : Maybe Pallet
        , size : Size
        , style : FontStyle
    }


view : Config a -> State -> String -> RootElement msg
view ({ pallet, icon } as config) state label =
    Button.view config state <|
        row None
            [ spacing 10

            -- ,center
            -- , verticalCenter
            ]
            [ icon
                |> Maybe.map
                    (\icon ->
                        Icon.view
                            { pallet =
                                Maybe.withDefault (Pallet Mono Lighten1) pallet
                            , options = []
                            }
                            icon
                    )
                |> Maybe.withDefault empty
            , Text.view (textConfig config) label
            ]


textConfig : Config a -> Text.Config {}
textConfig { pallet, size, style } =
    { style = style
    , size = size
    , line = OneLine
    , align = Center
    , pallet = pallet
    , onTable = False
    }
