module Stories.Molecule exposing (..)

import Stories.Molecule.Avatar as Avatar
import Stories.Molecule.Avatar.WithLabel as AvatarWithLabel
import Stories.Molecule.Bet.Board as BetBoard
import Stories.Molecule.Bet.Box as BetBox
import Stories.Molecule.Bet.Chip as BetChip
import Stories.Molecule.Bet.Chips as BetChips
import Stories.Molecule.Bet.Circle as BetCircle
import Stories.Molecule.Bet.Frame as BetFrame
import Stories.Molecule.Bet.Undos as BetUndos
import Stories.Molecule.Cards as Cards
import Stories.Molecule.Cards.Dealer as DealerCards
import Stories.Molecule.Table.Box.Dealer as DealerBox
import Stories.Molecule.Table.Box.Dealing as DealingBox
import Stories.Molecule.Text.Chip as ChipText
import Stories.Utils exposing (fromUIs)
import UIExplorer exposing (UI, createUI)


uiCategory : List UI
uiCategory =
    [ createUI "ChipText" ChipText.viewStories
    , createUI "Cards" Cards.viewStories
    , createUI "DealerCards" DealerCards.viewStories
    , createUI "Avatar" Avatar.viewStories
    , createUI "AvatarWithLabel" AvatarWithLabel.viewStories
    , createUI "DealingBox" DealingBox.viewStories
    , createUI "DealerBox" DealerBox.viewStories
    , createUI "BetChip" BetChip.viewStories
    , createUI "BetChips" BetChips.viewStories
    , createUI "BetUndos" BetUndos.viewStories
    , createUI "BetBoard" BetBoard.viewStories
    , createUI "BetCircle" BetCircle.viewStories
    , createUI "BetFrame" BetFrame.viewStories
    , createUI "BetBox" BetBox.viewStories
    ]


main =
    fromUIs uiCategory
