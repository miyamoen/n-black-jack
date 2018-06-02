module Stories.Organism.PlayerField exposing (viewStories)

import Rocket exposing ((=>))
import Stories.Dummy exposing (accounts, cards)
import Stories.Element exposing (toHtmlWithSymbol)
import Styles.Types exposing (angles)
import Types exposing (Player)
import UIExplorer exposing (renderStories)
import View.Organism.PlayerField exposing (Option, playerFieldDefault, view)


stories : List ( String, ( Option, Maybe Player ) )
stories =
    [ "Nothing" => ( playerFieldDefault, Nothing )
    ]
        ++ List.map4
            (\( label, account ) bet ( _, cards ) angle ->
                label
                    => ( { angle = angle }
                       , Just { cards = cards, bet = bet, account = account }
                       )
            )
            accounts
            [ Nothing, Just 1000, Just 1, Just 50, Just 500 ]
            cards
            angles


viewStories =
    renderStories (uncurry view >> toHtmlWithSymbol) stories
