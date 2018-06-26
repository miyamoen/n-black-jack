module Stories.Atom.Styles.TableBoard exposing (viewStories)

import Element exposing (Element, el, empty)
import Element.Attributes exposing (height, px, width)
import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtml)
import Types.Styles exposing (Styles(TableBoard))
import UIExplorer exposing (renderStories)


view : () -> Element Styles v m
view _ =
    el TableBoard [ width <| px 500, height <| px 500 ] empty


stories : List ( String, () )
stories =
    [ "default" => () ]


viewStories =
    renderStories (view >> toHtml) stories


main =
    fromStories viewStories
