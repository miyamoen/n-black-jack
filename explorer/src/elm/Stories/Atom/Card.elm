module Stories.Atom.Card exposing (viewStories)

import Element exposing (..)
import Element.Attributes exposing (spacing)
import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtmlWithSymbol)
import Types.Card exposing (..)
import Types.Styles exposing (Styles(None), Variation)
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
                    (\number -> Card suit number Up)
                    numbers
            )
            suits
    , "Spades" => [ List.map (\num -> Card Spade num Up) numbers ]
    , "Hearts" => [ List.map (\num -> Card Heart num Up) numbers ]
    , "Clubs" => [ List.map (\num -> Card Club num Up) numbers ]
    , "Diamonds" => [ List.map (\num -> Card Diamond num Up) numbers ]
    , "FaceDown" => [ [ Card Club Ace Down, Card Diamond Ace Down ] ]
    ]


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories


main =
    fromStories viewStories
