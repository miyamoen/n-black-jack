module PushableData exposing (..)


type PushableData data error
    = NotPushed data
    | FirstPushing { local : data, pushing : data }
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


local : PushableData data error -> data
local pushable =
    case pushable of
        NotPushed data ->
            data

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


update : (data -> data) -> PushableData data error -> PushableData data error
update func pushable =
    case pushable of
        NotPushed data ->
            NotPushed <| func data

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
