module Stories.Molecule exposing (..)

import Stories.Molecule.Avatar as Avatar
import Stories.Molecule.Avatar.WithLabel as AvatarWithLabel
import Stories.Molecule.Button.Chip as ChipButton
import Stories.Molecule.Cards as Cards
import Stories.Molecule.Cards.Dealer as DealerCards
import Stories.Molecule.Chip as Chip
import Stories.Molecule.Text.Chip as ChipText
import Stories.Molecule.Text.Point as PointText
import Stories.Molecule.Text.TableRule as TableRuleText
import Stories.Utils exposing (fromUIs)
import UIExplorer exposing (UI, createUI)


uiCategory : List UI
uiCategory =
    [ createUI "ChipText" ChipText.viewStories
    , createUI "PointText" PointText.viewStories
    , createUI "TableRuleText" TableRuleText.viewStories
    , createUI "ChipButton" ChipButton.viewStories
    , createUI "Chip" Chip.viewStories
    , createUI "Cards" Cards.viewStories
    , createUI "DealerCards" DealerCards.viewStories
    , createUI "Avatar" Avatar.viewStories
    , createUI "AvatarWithLabel" AvatarWithLabel.viewStories
    ]


main =
    fromUIs uiCategory
