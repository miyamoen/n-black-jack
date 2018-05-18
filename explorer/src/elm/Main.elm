module Main exposing (..)

import Stories.Colors as Colors
import UIExplorer exposing (addUICategory, app, createUI, emptyUICategories, fromUIList)


main =
    emptyUICategories
        |> addUICategory "Atom"
            [ createUI "Colors" Colors.viewStories ]
        |> app
