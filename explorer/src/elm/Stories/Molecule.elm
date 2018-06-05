module Stories.Molecule exposing (..)

import Stories.Molecule.AccountCard as AccountCard
import Stories.Molecule.AvatarWithLabel as AvatarWithLabel
import Stories.Molecule.CardBox as CardBox
import Stories.Molecule.Cards as Cards
import Stories.Molecule.ChipCircle as ChipCircle
import UIExplorer exposing (UI, createUI)


uiCategory : List UI
uiCategory =
    [ createUI "ChipCircle" ChipCircle.viewStories
    , createUI "Cards" Cards.viewStories
    , createUI "CardBox" CardBox.viewStories
    , createUI "AvatarWithLabel" AvatarWithLabel.viewStories
    , createUI "AccountCard" AccountCard.viewStories
    ]
