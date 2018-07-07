module PushableData
    exposing
        ( PushableData(..)
        , isPushable
        , isResetable
        , local
        , pushValue
        , remote
        , resetValues
        )


type PushableData data error
    = NotPushed { local : data, previous : data }
    | FirstPushing
        { local : data
        , pushing : data
        }
    | FirstFailure
        { local : data
        , failed : data
        , error : error
        }
    | Pushing
        { local : data
        , remote : data
        , pushing : data
        }
    | Failure
        { local : data
        , remote : data
        , failed : data
        , error : error
        }
    | Pushed { local : data, remote : data }
    | Deleting { local : data, remote : data }
    | DeleteFailure
        { local : data
        , remote : data
        , error : error
        }
    | Previous data



-- get


local : PushableData data error -> data
local pushable =
    case pushable of
        NotPushed { local } ->
            local

        FirstPushing { local } ->
            local

        FirstFailure { local } ->
            local

        Pushing { local } ->
            local

        Failure { local } ->
            local

        Pushed { local } ->
            local

        Deleting { local } ->
            local

        DeleteFailure { local } ->
            local

        Previous data ->
            data


remote : PushableData data error -> Maybe data
remote pushable =
    case pushable of
        NotPushed _ ->
            Nothing

        FirstPushing _ ->
            Nothing

        FirstFailure _ ->
            Nothing

        Pushing { remote } ->
            Just remote

        Failure { remote } ->
            Just remote

        Pushed { remote } ->
            Just remote

        Deleting { remote } ->
            Just remote

        DeleteFailure { remote } ->
            Just remote

        Previous _ ->
            Nothing



-- update


update : (data -> data) -> PushableData data error -> PushableData data error
update func pushable =
    case pushable of
        NotPushed record ->
            NotPushed { record | local = func record.local }

        FirstPushing record ->
            FirstPushing { record | local = func record.local }

        FirstFailure record ->
            FirstFailure { record | local = func record.local }

        Pushing record ->
            Pushing { record | local = func record.local }

        Failure record ->
            Failure { record | local = func record.local }

        Pushed record ->
            Pushed { record | local = func record.local }

        Deleting record ->
            Deleting { record | local = func record.local }

        DeleteFailure record ->
            DeleteFailure { record | local = func record.local }

        Previous data ->
            Previous <| func data


replace : data -> PushableData data error -> PushableData data error
replace data pushable =
    update (always data) pushable



-- reset


resetValues : PushableData data error -> List data
resetValues pushable =
    case pushable of
        NotPushed { local, previous } ->
            notEqualValues local [ previous ]

        FirstPushing { local, pushing } ->
            notEqualValues local [ pushing ]

        FirstFailure { local, failed } ->
            notEqualValues local [ failed ]

        Pushing { local, remote, pushing } ->
            notEqualValues local [ pushing, remote ]

        Failure { local, remote, failed } ->
            notEqualValues local [ failed, remote ]

        Pushed { local, remote } ->
            notEqualValues local [ remote ]

        Deleting { local, remote } ->
            notEqualValues local [ remote ]

        DeleteFailure { local, remote } ->
            notEqualValues local [ remote ]

        Previous data ->
            [ data ]


isResetable : PushableData data error -> Bool
isResetable pushable =
    resetValues pushable
        |> List.isEmpty
        |> not



-- push


pushValue : PushableData data error -> Maybe data
pushValue pushable =
    case pushable of
        NotPushed { local } ->
            Just local

        FirstPushing { local, pushing } ->
            notEqualTo pushing local

        FirstFailure { local, failed } ->
            Just local

        Pushing { local, pushing } ->
            notEqualTo pushing local

        Failure { local, remote, failed } ->
            notEqualTo remote local

        Pushed { local, remote } ->
            notEqualTo remote local

        Deleting { local } ->
            Just local

        DeleteFailure { local, remote } ->
            notEqualTo remote local

        Previous data ->
            Nothing


isPushable : PushableData data error -> Bool
isPushable pushable =
    pushValue pushable
        |> Maybe.map (always True)
        |> Maybe.withDefault False



-- helper


notEqualTo : a -> a -> Maybe a
notEqualTo compare value =
    if compare == value then
        Nothing
    else
        Just value


notEqualValues : a -> List a -> List a
notEqualValues pivot values =
    List.filter ((/=) pivot) values
