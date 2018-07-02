module PushableData
    exposing
        ( PushableData(..)
        , isPushable
        , isResetable
        , local
        , pushValue
        , remote
        , reset
        , resetValue
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


resetValue : PushableData data error -> Maybe data
resetValue pushable =
    case pushable of
        NotPushed { local, previous } ->
            notEqualValue local [ previous ]

        FirstPushing { local, pushing } ->
            notEqualValue local [ pushing ]

        FirstFailure { local, failed } ->
            notEqualValue local [ failed ]

        Pushing { local, remote, pushing } ->
            notEqualValue local [ pushing, remote ]

        Failure { local, remote, failed } ->
            notEqualValue local [ failed, remote ]

        Pushed { local, remote } ->
            notEqualValue local [ remote ]

        Deleting { local, remote } ->
            notEqualValue local [ remote ]

        DeleteFailure { local, remote } ->
            notEqualValue local [ remote ]

        Previous data ->
            Nothing


isResetable : PushableData data error -> Bool
isResetable pushable =
    resetValue pushable
        |> Maybe.map (always True)
        |> Maybe.withDefault False


reset : PushableData data error -> PushableData data error
reset pushable =
    resetValue pushable
        |> Maybe.withDefault (local pushable)
        |> (\val -> replace val pushable)



-- push


pushValue : PushableData data error -> Maybe data
pushValue pushable =
    case pushable of
        NotPushed { local } ->
            Just local

        FirstPushing { local, pushing } ->
            notEqualValue pushing [ local ]

        FirstFailure { local, failed } ->
            Just local

        Pushing { local, pushing } ->
            notEqualValue pushing [ local ]

        Failure { local, remote, failed } ->
            notEqualValue remote [ local ]

        Pushed { local, remote } ->
            notEqualValue remote [ local ]

        Deleting { local } ->
            Just local

        DeleteFailure { local, remote } ->
            notEqualValue remote [ local ]

        Previous data ->
            Nothing


isPushable : PushableData data error -> Bool
isPushable pushable =
    pushValue pushable
        |> Maybe.map (always True)
        |> Maybe.withDefault False



-- helper


notEqualValue : a -> List a -> Maybe a
notEqualValue pivot values =
    List.filter ((==) pivot) values
        |> List.head
