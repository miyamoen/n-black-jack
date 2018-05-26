module View.Atom.Text exposing (description, label)

import Element exposing (..)
import Element.Attributes exposing (alignLeft, spacing)
import Styles.Types exposing (..)


label : FontStyle -> FontSize -> String -> Element Styles variation msg
label fontStyle size content =
    node "label" <|
        el (Label fontStyle size) [] <|
            Element.text content


description : FontStyle -> List String -> Element Styles variation msg
description fontStyle contents =
    contents
        |> List.map
            (\content -> paragraph (Body fontStyle Small) [] [ Element.text content ])
        |> Element.textLayout None [ spacing 10 ]
