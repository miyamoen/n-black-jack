module Stories.Atom exposing (..)

import Stories.Atom.Chip as Chip
import Stories.Atom.Colors as Colors
import Stories.Atom.Table as Table
import Stories.Atom.Text as Text
import UIExplorer exposing (UI, createUI)


uiCategory : List UI
uiCategory =
    [ createUI "Colors" Colors.viewStories
    , createUI "Label" Text.viewLabelsStories
    , createUI "Description" Text.viewDescriptionsStories
    , createUI "Table" Table.viewStories
    , createUI "ChipSymbol" Chip.viewStories
    ]
