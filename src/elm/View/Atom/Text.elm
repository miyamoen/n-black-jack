module View.Atom.Text exposing (description, label, text)

import Element exposing (..)
import Element.Attributes exposing (alignLeft, spacing)
import Styles exposing (Styles(..))
import Styles.Text exposing (..)


label : FontStyle -> Size -> String -> Element Styles variation msg
label fontStyle size content =
    node "label" <|
        text fontStyle size content


text : FontStyle -> Size -> String -> Element Styles variation msg
text fontStyle size content =
    el (Title fontStyle size) [] <|
        Element.text content


description : FontStyle -> List String -> Element Styles variation msg
description fontStyle contents =
    contents
        |> List.map
            (\content -> paragraph (Text fontStyle Small) [] [ Element.text content ])
        |> textLayout None [ spacing 10 ]
