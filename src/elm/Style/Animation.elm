module Style.Animation
    exposing
        ( Animation
        , Direction(..)
        , Fill(..)
        , Iteration(..)
        , State(..)
        , animations
        , defaultAnimation
        , name
        , state
        )

import Style exposing (Property, prop)
import Time exposing (Time)


type alias Animation =
    { name : String
    , duration : Time
    , easing : String
    , delay : Time
    , iteration : Iteration
    , direction : Direction
    , fill : Fill
    , state : State
    }


type Iteration
    = Many Float
    | Infinite


type Direction
    = Normal
    | Alternate
    | Reverse
    | AlternateReverse


type Fill
    = None
    | Forwards
    | Backwards
    | Both


type State
    = Running
    | Pause


animations : List Animation -> Property style variation
animations list =
    list
        |> List.map animationToString
        |> String.join ", "
        |> prop "animation"


animationToString : Animation -> String
animationToString { name, duration, easing, delay, iteration, direction, fill, state } =
    [ name
    , timeToCss duration
    , easing
    , timeToCss delay
    , iterationToCss iteration
    , directionToCss direction
    , fillToCss fill
    , stateToCss state
    ]
        |> String.join " "


name : String -> Property style variation
name str =
    prop "animation-name" str


timeToCss : Time -> String
timeToCss time =
    toString (time * Time.millisecond) ++ "ms"


iterationToCss : Iteration -> String
iterationToCss iter =
    case iter of
        Many float ->
            toString float

        Infinite ->
            "infinite"


directionToCss : Direction -> String
directionToCss dir =
    case dir of
        Normal ->
            "normal"

        Reverse ->
            "reverse"

        Alternate ->
            "Alternate"

        AlternateReverse ->
            "alternate-reverse"


fillToCss : Fill -> String
fillToCss fill =
    case fill of
        None ->
            "none"

        Forwards ->
            "forwards"

        Backwards ->
            "backwards"

        Both ->
            "both"


state : State -> Property style variation
state st =
    prop "animation-play-state" <| stateToCss st


stateToCss : State -> String
stateToCss st =
    case st of
        Running ->
            "running"

        Pause ->
            "pause"


defaultAnimation : Animation
defaultAnimation =
    { name = "none"
    , duration = 130
    , easing = "ease"
    , delay = 0
    , iteration = Many 1
    , direction = Normal
    , fill = None
    , state = Running
    }
