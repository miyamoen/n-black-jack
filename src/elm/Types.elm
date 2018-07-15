module Types exposing (..)

import Types.Card exposing (..)


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


type Action
    = Hit
    | Stand


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
    , betLimit : Limit
    , bases : Int
    , presence : Int
    }


type alias Table =
    { id : TableId
    , betLimit : Limit
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


type Base
    = First
    | Second
    | Third
    | Fourth
    | Fifth


type alias Limit =
    { min : Int, max : Int }
