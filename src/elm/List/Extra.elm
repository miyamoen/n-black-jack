module List.Extra exposing (lift2, unique)

import Set exposing (Set)


lift2 : (a -> b -> c) -> List a -> List b -> List c
lift2 f la lb =
    la
        |> List.concatMap
            (\a -> lb |> List.map (\b -> f a b))


unique : List comparable -> List comparable
unique list =
    uniqueHelp identity Set.empty list []


uniqueHelp : (a -> comparable) -> Set comparable -> List a -> List a -> List a
uniqueHelp f existing remaining accumulator =
    case remaining of
        [] ->
            List.reverse accumulator

        first :: rest ->
            let
                computedFirst =
                    f first
            in
            if Set.member computedFirst existing then
                uniqueHelp f existing rest accumulator
            else
                uniqueHelp f (Set.insert computedFirst existing) rest (first :: accumulator)
