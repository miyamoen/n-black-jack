module Stories.Molecule exposing (..)

import Stories.Molecule.Avatar as Avatar
import Stories.Molecule.Avatar.WithLabel as AvatarWithLabel
import Stories.Molecule.Betting.Button as BettingButton
import Stories.Molecule.Betting.Buttons as BettingButtons
import Stories.Molecule.Betting.ResetButton as BettingResetButton
import Stories.Molecule.Button.Chip as ChipButton
import Stories.Molecule.Cards as Cards
import Stories.Molecule.Cards.Dealer as DealerCards
import Stories.Molecule.Chip as Chip
import Stories.Molecule.Table.Box.Betting as BettingBox
import Stories.Molecule.Table.Box.Dealer as DealerBox
import Stories.Molecule.Table.Box.Dealing as DealingBox
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
    , createUI "BettingBox" BettingBox.viewStories
    , createUI "DealingBox" DealingBox.viewStories
    , createUI "DealerBox" DealerBox.viewStories
    , createUI "BettingButton" BettingButton.viewStories
    , createUI "BettingButtons" BettingButtons.viewStories
    , createUI "BettingResetButton" BettingResetButton.viewStories
    ]


main =
    fromUIs uiCategory
