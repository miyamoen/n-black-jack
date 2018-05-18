module Stories.Atom exposing (..)

import Stories.Atom.Colors as Colors
import Stories.Atom.Text as Text
import UIExplorer exposing (UI, createUI)


uiCategory : List UI
uiCategory =
    [ createUI "Colors" Colors.viewStories
    , createUI "Label" Text.viewLabelsStories
    , createUI "Description" Text.viewDescriptionsStories
    ]
