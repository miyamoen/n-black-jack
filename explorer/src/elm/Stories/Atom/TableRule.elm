module Stories.Atom.TableRule exposing (viewStories)

import Rocket exposing ((=>))
import Stories.Element exposing (toHtml)
import Types exposing (Phase(..))
import UIExplorer exposing (renderStories)
import View.Atom.TableRule exposing (view)


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
