module Element.Utils exposing (..)

import Element exposing (Attribute)
import Element.Attributes exposing (..)


maybeVary : (a -> variation) -> Maybe a -> Attribute variation msg
maybeVary tagger maybe =
    case maybe of
        Just a ->
            vary (tagger a) True

        Nothing ->
            attribute "" ""
