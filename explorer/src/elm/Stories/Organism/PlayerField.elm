module Stories.Organism.PlayerField exposing (viewStories)

import Rocket exposing ((=>))
import Stories.Dummy exposing (accounts, cards)
import Stories.Element exposing (toHtmlWithSymbol)
import Types exposing (Player)
import UIExplorer exposing (renderStories)
import View.Organism.PlayerField exposing (view)


stories : List ( String, Maybe Player )
stories =
    [ "Nothing" => Nothing
    ]
        ++ List.map3
            (\( label, account ) bet ( _, cards ) ->
                label
                    => Just
                        { cards = cards
                        , bet = bet
                        , account = account
                        , betHistory = []
                        }
            )
            accounts
            [ Nothing, Just 1000, Just 1, Just 50, Just 500 ]
            cards


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories
