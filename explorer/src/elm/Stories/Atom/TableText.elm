module Stories.Atom.TableText exposing (viewStories)

import Element exposing (Element, el)
import Element.Attributes exposing (padding)
import Rocket exposing ((=>))
import Stories.Element exposing (toHtml)
import Styles.Types exposing (Styles(Table), Variation, fontSizes)
import UIExplorer exposing (renderStories)
import View.Atom.TableText as TableText exposing (Option)


view : Option -> Element Styles Variation msg
view option =
    el Table [ padding 10 ] <|
        TableText.view option "DUMMY TEXT"


stories : List ( String, Option )
stories =
    fontSizes
        |> List.map (\size -> toString size => { size = size })


viewStories =
    renderStories (view >> toHtml) stories
