module Stories.Molecule exposing (..)

import Stories.Molecule.CardBox as CardBox
import Stories.Molecule.Cards as Cards
import Stories.Molecule.Chip as Chip
import Stories.Molecule.ChipCircle as ChipCircle
import UIExplorer exposing (UI, createUI)


uiCategory : List UI
uiCategory =
    [ createUI "Chip" Chip.viewStories
    , createUI "ChipCircle" ChipCircle.viewStories
    , createUI "Cards" Cards.viewStories
    , createUI "CardBox" CardBox.viewStories
    ]
