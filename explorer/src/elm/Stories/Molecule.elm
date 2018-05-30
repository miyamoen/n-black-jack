module Stories.Molecule exposing (..)

import Stories.Molecule.AvatarWithLabel as AvatarWithLabel
import Stories.Molecule.CardBox as CardBox
import Stories.Molecule.Cards as Cards
import Stories.Molecule.ChipCircle as ChipCircle
import Stories.Molecule.DealerHand as DealerHand
import Stories.Molecule.UserCard as UserCard
import UIExplorer exposing (UI, createUI)


uiCategory : List UI
uiCategory =
    [ createUI "ChipCircle" ChipCircle.viewStories
    , createUI "Cards" Cards.viewStories
    , createUI "CardBox" CardBox.viewStories
    , createUI "DealerHand" DealerHand.viewStories
    , createUI "AvatarWithLabel" AvatarWithLabel.viewStories
    , createUI "UserCard" UserCard.viewStories
    ]
