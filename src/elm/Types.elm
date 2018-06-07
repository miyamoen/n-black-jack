module Types exposing (..)

import List.Extra exposing (lift2)


type Account
    = Authenticated
        { id : String
        , chip : Float
        , name : Maybe String
        , iconUrl : Maybe String
        }
    | Anonymous { id : String, chip : Float }
    | Unauthenticated


type alias Player =
    { account : Account
    , cards : List Card
    , bet : Maybe Int
    }


type alias Dealer =
    { cards : List Card }


type Phase
    = WaitingBet
    | DealingCards
    | PlayerAction
    | DealerAction
    | WaitingNextGame


type alias Table =
    { dealer : Dealer
    , phase : Phase
    , first : Maybe Player
    , second : Maybe Player
    , third : Maybe Player
    , fourth : Maybe Player
    , fifth : Maybe Player
    }


type Suit
    = Spade
    | Heart
    | Club
    | Diamond


suits : List Suit
suits =
    [ Spade, Heart, Club, Diamond ]


type Number
    = Ace
    | Two
    | Three
    | Four
    | Five
    | Six
    | Seven
    | Eight
    | Nine
    | Ten
    | Jack
    | Queen
    | King


numbers : List Number
numbers =
    [ Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King ]


type Face
    = Up
    | Down


type alias Card =
    { suit : Suit
    , number : Number
    , face : Face
    }


cards : List Card
cards =
    lift2 (\suit number -> Card suit number Down) suits numbers


type Point
    = BlackJack
    | TwentyOne
    | Point Int
    | PointOr Int Int
    | Bust
