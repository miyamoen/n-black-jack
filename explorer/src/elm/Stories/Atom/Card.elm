module Stories.Atom.Card exposing (viewStories)

import Element exposing (Element, column, empty, row, text, wrappedRow)
import Element.Attributes exposing (spacing)
import Rocket exposing ((=>))
import Stories.Element exposing (toHtmlWithSymbol)
import Styles exposing (Styles(None), Variation)
import Types exposing (Card, Number(..), Suit(..), numbers, suits)
import UIExplorer exposing (renderStories)
import View.Atom.Card as Card


view : List (List Card) -> Element Styles Variation msg
view cardsList =
    column None [ spacing 2 ] <|
        List.map
            (\cards ->
                wrappedRow None [ spacing 2 ] <|
                    List.map Card.view cards
            )
            cardsList


stories : List ( String, List (List Card) )
stories =
    [ "AllCards"
        => List.map
            (\suit ->
                List.map
                    (\number -> Card suit number)
                    numbers
            )
            suits
    , "Spades" => [ List.map (Card Spade) numbers ]
    , "Hearts" => [ List.map (Card Heart) numbers ]
    , "Clubs" => [ List.map (Card Club) numbers ]
    , "Diamonds" => [ List.map (Card Diamond) numbers ]
    ]


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories
