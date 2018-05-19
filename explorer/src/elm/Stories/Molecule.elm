module Stories.Molecule exposing (..)

import Stories.Molecule.Chip as Chip
import UIExplorer exposing (UI, createUI)


uiCategory : List UI
uiCategory =
    [ createUI "Chip" Chip.viewStories
    ]
