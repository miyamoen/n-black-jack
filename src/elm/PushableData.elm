module PushableData
    exposing
        ( PushableData(..)
        , error
        , failedValue
        , isError
        , isProcessing
        , isPushable
        , isResetable
        , local
        , processValue
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



-- process


processValue : PushableData data error -> Maybe data
processValue pushable =
    case pushable of
        FirstPushing { pushing } ->
            Just pushing

        Pushing { pushing } ->
            Just pushing

        Deleting _ ->
            Nothing

        _ ->
            Nothing


isProcessing : PushableData data error -> Bool
isProcessing pushable =
    case pushable of
        FirstPushing _ ->
            True

        Pushing _ ->
            True

        Deleting _ ->
            True

        _ ->
            False



-- error


error : PushableData data error -> Maybe error
error pushable =
    case pushable of
        FirstFailure { error } ->
            Just error

        Failure { error } ->
            Just error

        DeleteFailure { error } ->
            Just error

        _ ->
            Nothing


isError : PushableData data error -> Bool
isError pushable =
    error pushable
        |> Maybe.map (always True)
        |> Maybe.withDefault False


failedValue : PushableData data error -> Maybe data
failedValue pushable =
    case pushable of
        FirstFailure { failed } ->
            Just failed

        Failure { failed } ->
            Just failed

        DeleteFailure _ ->
            Nothing

        _ ->
            Nothing



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
