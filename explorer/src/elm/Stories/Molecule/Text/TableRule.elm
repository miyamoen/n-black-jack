module Stories.Molecule.Text.TableRule exposing (viewStories)

import Element exposing (el)
import Rocket exposing ((=>))
import Stories.Utils exposing (toHtml, fromStories)
import Types exposing (Phase(..))
import Types.Styles exposing (..)
import UIExplorer exposing (renderStories)
import View.Molecule.Text.TableRule as TableRule


view : Phase -> RootElement msg
view phase =
    el TableBoard [] <| TableRule.view phase


stories : List ( String, Phase )
stories =
    [ WaitingBet
    , DealingCards
    , PlayerAction
    , DealerAction
    , WaitingNextGame
    ]
        |> List.map (\phase -> toString phase => phase)


viewStories =
    renderStories (view >> toHtml) stories


main =
    fromStories viewStories
