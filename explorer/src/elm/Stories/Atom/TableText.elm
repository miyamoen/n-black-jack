module Stories.Atom.TableText exposing (viewStories)

import Rocket exposing ((=>))
import Stories.Element exposing (toHtml)
import Types exposing (Phase(..))
import UIExplorer exposing (renderStories)
import View.Atom.TableText exposing (view)


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
