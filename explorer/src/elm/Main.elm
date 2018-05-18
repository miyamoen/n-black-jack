module Main exposing (..)

import Stories.Colors as Colors
import Stories.Text as Text
import UIExplorer exposing (addUICategory, app, createUI, emptyUICategories, fromUIList)


main =
    emptyUICategories
        |> addUICategory "Atom"
            [ createUI "Colors" Colors.viewStories
            , createUI "Label" Text.viewLabelsStories
            , createUI "Description" Text.viewDescriptionsStories
            ]
        |> app
