module Stories.Molecule exposing (..)

import Stories.Molecule.CardBox as CardBox
import Stories.Molecule.Cards as Cards
import Stories.Molecule.ChipCircle as ChipCircle
import Stories.Molecule.User as User
import UIExplorer exposing (UI, createUI)


uiCategory : List UI
uiCategory =
    [ createUI "ChipCircle" ChipCircle.viewStories
    , createUI "Cards" Cards.viewStories
    , createUI "CardBox" CardBox.viewStories
    , createUI "User" User.viewStories
    ]
