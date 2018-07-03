module Stories.Organism exposing (..)

import Stories.Organism.Betting as Betting
import Stories.Organism.Table as Table
import Stories.Organism.Table.Base as Base
import Stories.Organism.Table.Bases as Bases
import Stories.Utils exposing (fromUIs)
import UIExplorer exposing (UI, createUI)


uiCategory : List UI
uiCategory =
    [ createUI "Base" Base.viewStories
    , createUI "Bases" Bases.viewStories
    , createUI "Betting" Betting.viewStories
    , createUI "Table" Table.viewStories
    ]


main =
    fromUIs uiCategory
