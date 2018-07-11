module PushableData exposing (..)


type PushableData data error
    = NotSelected
    | Pushing data
    | PushFailure { failed : data, error : error }
    | Pushed data
    | NotActive


data : PushableData data error -> Maybe data
data pushable =
    case pushable of
        NotSelected ->
            Nothing

        Pushing data_ ->
            Just data_

        PushFailure { failed } ->
            Just failed

        Pushed data_ ->
            Just data_

        NotActive ->
            Nothing


isActive : PushableData data error -> Bool
isActive pushable =
    case pushable of
        NotActive ->
            False

        _ ->
            True


isError : PushableData data error -> Bool
isError pushable =
    case pushable of
        PushFailure _ ->
            True

        _ ->
            False


isProcessing : PushableData data error -> Bool
isProcessing pushable =
    case pushable of
        Pushing _ ->
            True

        _ ->
            False
