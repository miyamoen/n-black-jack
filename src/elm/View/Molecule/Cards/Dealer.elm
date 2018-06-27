module View.Molecule.Cards.Dealer exposing (view)

import Element exposing (..)
import Element.Attributes exposing (..)
import Types exposing (..)
import Types.Styles exposing (..)
import View.Atom.Card as Card


view : List Card -> RootElement msg
view cards =
    el None [ width <| px 72, height <| px 110 ] empty
        |> within
            (case cards of
                up :: [] ->
                    [ elByRight -41 <| Card.view up
                    , elByRight 41 <| Card.view holeCard
                    ]

                second :: first :: [] ->
                    [ elByRight -41 <| Card.view first
                    , elByRight 41 <| Card.view second
                    ]

                _ ->
                    List.reverse cards
                        |> List.indexedMap
                            (\index card ->
                                elByRight (-41 + 41 * toFloat index) <|
                                    Card.view card
                            )
            )


elByRight : Float -> Element Styles v msg -> Element Styles v msg
elByRight dx element =
    el None [ moveRight dx ] element


holeCard : Card
holeCard =
    Card Spade Ace Down
