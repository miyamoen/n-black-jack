module Types exposing (..)

import List.Extra exposing (lift2)


type alias TableId =
    String


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
    , betHistory : List Int
    }


type Seating
    = Me
    | Other Player


type alias Dealer =
    { cards : List Card }


type Phase
    = WaitingBet
    | DealingCards
    | PlayerAction
    | DealerAction
    | WaitingNextGame


{-| Table Infomation listed on Tables Route
-}
type alias TableInfo =
    { id : TableId
    , name : String
    , betLimit : BetLimit
    , bases : Int
    , presence : Int
    }


type alias CreateTable =
    { name : String
    , betLimit : BetLimit
    , baseNumber : Int
    }


type alias Table =
    { id : TableId
    , betLimit : BetLimit
    , dealer : Dealer
    , me : Player
    , bases : Bases
    , phase : Phase
    }


type Bases
    = FiveBases
        { first : Maybe Seating
        , second : Maybe Seating
        , third : Maybe Seating
        , fourth : Maybe Seating
        , fifth : Maybe Seating
        }


type alias BetLimit =
    { min : Int, max : Int }


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
