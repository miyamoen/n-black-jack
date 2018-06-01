module Stories.Organism exposing (..)

import Stories.Organism.PlayerField as PlayerField
import UIExplorer exposing (UI, createUI)


uiCategory : List UI
uiCategory =
    [ createUI "PlayerField" PlayerField.viewStories
    ]
