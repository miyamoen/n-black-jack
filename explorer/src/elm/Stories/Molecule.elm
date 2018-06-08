module Stories.Molecule exposing (..)

import Stories.Molecule.AccountCard as AccountCard
import Stories.Molecule.AvatarWithLabel as AvatarWithLabel
import Stories.Molecule.CardBox as CardBox
import Stories.Molecule.Cards as Cards
import Stories.Molecule.ChipBox as ChipBox
import Stories.Molecule.DealerHand as DealerHand
import UIExplorer exposing (UI, createUI)


uiCategory : List UI
uiCategory =
    [ createUI "ChipBox" ChipBox.viewStories
    , createUI "Cards" Cards.viewStories
    , createUI "CardBox" CardBox.viewStories
    , createUI "AvatarWithLabel" AvatarWithLabel.viewStories
    , createUI "DealerHand" DealerHand.viewStories
    , createUI "AccountCard" AccountCard.viewStories
    ]
