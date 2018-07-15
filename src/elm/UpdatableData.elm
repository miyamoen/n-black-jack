module UpdatableData
    exposing
        ( UpdatableData(..)
        , error
        , failedValue
        , isError
        , isNotActive
        , isProcessing
        , isPushable
        , isResetable
        , local
        , processValue
        , pushValue
        , remote
        , resetValues
        )


type UpdatableData data error
    = NotPushed { local : data, previous : data }
    | Pushing
        { local : data
        , pushing : data
        }
    | PushFailure
        { local : data
        , failed : data
        , error : error
        }
    | Updating
        { local : data
        , remote : data
        , pushing : data
        }
    | UpdateFailure
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


local : UpdatableData data error -> data
local updatable =
    case updatable of
        NotPushed { local } ->
            local

        Pushing { local } ->
            local

        PushFailure { local } ->
            local

        Updating { local } ->
            local

        UpdateFailure { local } ->
            local

        Pushed { local } ->
            local

        Deleting { local } ->
            local

        DeleteFailure { local } ->
            local

        Previous data ->
            data


remote : UpdatableData data error -> Maybe data
remote updatable =
    case updatable of
        NotPushed _ ->
            Nothing

        Pushing _ ->
            Nothing

        PushFailure _ ->
            Nothing

        Updating { remote } ->
            Just remote

        UpdateFailure { remote } ->
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


update : (data -> data) -> UpdatableData data error -> UpdatableData data error
update func updatable =
    case updatable of
        NotPushed record ->
            NotPushed { record | local = func record.local }

        Pushing record ->
            Pushing { record | local = func record.local }

        PushFailure record ->
            PushFailure { record | local = func record.local }

        Updating record ->
            Updating { record | local = func record.local }

        UpdateFailure record ->
            UpdateFailure { record | local = func record.local }

        Pushed record ->
            Pushed { record | local = func record.local }

        Deleting record ->
            Deleting { record | local = func record.local }

        DeleteFailure record ->
            DeleteFailure { record | local = func record.local }

        Previous data ->
            Previous <| func data


replace : data -> UpdatableData data error -> UpdatableData data error
replace data updatable =
    update (always data) updatable



-- reset


resetValues : UpdatableData data error -> List data
resetValues updatable =
    case updatable of
        NotPushed { local, previous } ->
            notEqualValues local [ previous ]

        Pushing { local, pushing } ->
            notEqualValues local [ pushing ]

        PushFailure { local, failed } ->
            notEqualValues local [ failed ]

        Updating { local, remote, pushing } ->
            notEqualValues local [ pushing, remote ]

        UpdateFailure { local, remote, failed } ->
            notEqualValues local [ failed, remote ]

        Pushed { local, remote } ->
            notEqualValues local [ remote ]

        Deleting { local, remote } ->
            notEqualValues local [ remote ]

        DeleteFailure { local, remote } ->
            notEqualValues local [ remote ]

        Previous data ->
            [ data ]


isResetable : UpdatableData data error -> Bool
isResetable updatable =
    resetValues updatable
        |> List.isEmpty
        |> not



-- push


pushValue : UpdatableData data error -> Maybe data
pushValue updatable =
    case updatable of
        NotPushed { local } ->
            Just local

        Pushing { local, pushing } ->
            notEqualTo pushing local

        PushFailure { local, failed } ->
            Just local

        Updating { local, pushing } ->
            notEqualTo pushing local

        UpdateFailure { local, remote, failed } ->
            notEqualTo remote local

        Pushed { local, remote } ->
            notEqualTo remote local

        Deleting { local } ->
            Just local

        DeleteFailure { local, remote } ->
            notEqualTo remote local

        Previous data ->
            Nothing


isPushable : UpdatableData data error -> Bool
isPushable updatable =
    pushValue updatable
        |> Maybe.map (always True)
        |> Maybe.withDefault False



-- process


processValue : UpdatableData data error -> Maybe data
processValue updatable =
    case updatable of
        Pushing { pushing } ->
            Just pushing

        Updating { pushing } ->
            Just pushing

        Deleting _ ->
            Nothing

        _ ->
            Nothing


isProcessing : UpdatableData data error -> Bool
isProcessing updatable =
    case updatable of
        Pushing _ ->
            True

        Updating _ ->
            True

        Deleting _ ->
            True

        _ ->
            False



-- error


error : UpdatableData data error -> Maybe error
error updatable =
    case updatable of
        PushFailure { error } ->
            Just error

        UpdateFailure { error } ->
            Just error

        DeleteFailure { error } ->
            Just error

        _ ->
            Nothing


isError : UpdatableData data error -> Bool
isError updatable =
    error updatable
        |> Maybe.map (always True)
        |> Maybe.withDefault False


failedValue : UpdatableData data error -> Maybe data
failedValue updatable =
    case updatable of
        PushFailure { failed } ->
            Just failed

        UpdateFailure { failed } ->
            Just failed

        DeleteFailure _ ->
            Nothing

        _ ->
            Nothing


isNotActive : UpdatableData data error -> Bool
isNotActive updatable =
    case updatable of
        Previous _ ->
            True

        _ ->
            False



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
