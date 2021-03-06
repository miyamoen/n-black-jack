module View.Atom.Button exposing (Config, view)

import Color.Pallet exposing (..)
import Element exposing (..)
import Element.Attributes exposing (..)
import FontAwesome exposing (Icon)
import Types.Styles exposing (..)
import Types.Styles.Clickable exposing (..)
import Types.Styles.Text exposing (..)
import View.Atom.Clickable as Clickable
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
view ({ pallet, icon, size } as config) state label =
    Clickable.view config state <|
        row None
            [ spacing 10
            , paddingXY 20 1
            ]
            [ whenJust icon
                (\icon ->
                    Icon.view
                        { pallet =
                            Maybe.withDefault (Pallet Mono Lighten1) pallet
                        , size = size
                        , options = []
                        }
                        icon
                )
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
