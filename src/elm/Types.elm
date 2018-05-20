module Types exposing (..)

import List.Extra exposing (lift2)


type User
    = Authenticated
        { id : String
        , name : Maybe String
        , iconUrl : Maybe String
        }
    | Anonymous { id : String }
    | Unauthenticated


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


type alias Card =
    { suit : Suit, number : Number }


cards : List Card
cards =
    lift2 Card suits numbers
