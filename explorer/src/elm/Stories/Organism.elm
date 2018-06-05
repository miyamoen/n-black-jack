module Stories.Organism exposing (..)

import Stories.Organism.DealerField as DealerField
import Stories.Organism.PlayerField as PlayerField
import Stories.Organism.Table as Table
import UIExplorer exposing (UI, createUI)


uiCategory : List UI
uiCategory =
    [ createUI "PlayerField" PlayerField.viewStories
    , createUI "DealerField" DealerField.viewStories
    ]
