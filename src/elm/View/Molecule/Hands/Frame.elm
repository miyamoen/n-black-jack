module View.Molecule.Hands.Frame exposing (Data, view)

import Color.Pallet exposing (..)
import Element exposing (..)
import Element.Attributes exposing (..)
import PushableData exposing (PushableData(..))
import Types exposing (Action(..))
import Types.Card exposing (Card)
import Types.Firebase as Firebase
import Types.Styles exposing (..)
import Types.Styles.Selector as Selector
import Types.Styles.Text exposing (..)
import View.Atom.Icon.Edit as EditIcon
import View.Atom.Icon.Error as ErrorIcon
import View.Atom.Icon.Loading as LoadingIcon
import View.Atom.Selector as Selector
import View.Atom.Text as Text
import View.Atom.Text.Point as Point
import View.Molecule.Hands.Cards as Cards


type alias Data a =
    { a
        | cards : List Card
        , action : PushableData Action Firebase.Error
    }


view : Data a -> RootElement msg
view data =
    column None
        [ center
        , spacing 5
        , inlineStyle [ ( "z-index", "20" ) ]
        ]
        [ Cards.view data
            |> onLeft [ el None [ moveLeft 5 ] <| icon data ]
        , el None [ height <| px 50 ] <|
            if List.isEmpty data.cards then
                empty
            else
                Point.view textConfig data.cards
        ]


icon : Data a -> RootElement msg
icon { action } =
    case action of
        NotSelected ->
            EditIcon.view iconConfig

        Pushing action ->
            column None
                []
                [ actionIcon Selector.Selected action
                , LoadingIcon.view iconConfig
                ]

        PushFailure { failed } ->
            ErrorIcon.view iconConfig

        Pushed action ->
            actionIcon Selector.Confirmed action

        NotActive ->
            empty


textConfig : Text.Config {}
textConfig =
    { style = Regular
    , size = Medium
    , line = OneLine
    , align = Center
    , pallet = Just <| Pallet Orange Lighten1
    , onTable = True
    }


iconConfig : { size : Size }
iconConfig =
    { size = Normal }


actionIcon : Selector.State -> Action -> RootElement msg
actionIcon state action =
    Selector.view
        { hue =
            case action of
                Hit ->
                    Blue

                Stand ->
                    Red
        , size = Tiny
        , boxSize = px 30
        }
        state
        (String.left 1 <| toString action)
