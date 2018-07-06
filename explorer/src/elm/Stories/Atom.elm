module Stories.Atom exposing (..)

import Stories.Atom.Avatar as Avatar
import Stories.Atom.Button as Button
import Stories.Atom.Button.Bet as BetButton
import Stories.Atom.Button.Chip as ChipButton
import Stories.Atom.Button.Close as CloseButton
import Stories.Atom.Card as Card
import Stories.Atom.Chip as Chip
import Stories.Atom.Clickable as Clickable
import Stories.Atom.Icon as Icon
import Stories.Atom.Icon.Bet as BetIcon
import Stories.Atom.Icon.Close as CloseIcon
import Stories.Atom.Layout.Modal as Modal
import Stories.Atom.Selector as Selector
import Stories.Atom.Styles.Board as Board
import Stories.Atom.Styles.Color as Color
import Stories.Atom.Styles.Frame as Frame
import Stories.Atom.Symbol as Symbol
import Stories.Atom.Text as Text
import Stories.Atom.Text.OnTable as TextOnTable
import Stories.Utils exposing (fromUIs)
import UIExplorer exposing (UI, createUI)


uiCategory : List UI
uiCategory =
    [ createUI "Color" Color.viewStories
    , createUI "Frame" Frame.viewStories
    , createUI "Board" Board.viewStories
    , createUI "Modal" Modal.viewStories
    , createUI "Symbol" Symbol.viewStories
    , createUI "Card" Card.viewStories
    , createUI "Text" Text.viewStories
    , createUI "TextOnTable" TextOnTable.viewStories
    , createUI "Clickable" Clickable.viewStories
    , createUI "Button" Button.viewStories
    , createUI "Selector" Selector.viewStories
    , createUI "Avatar" Avatar.viewStories
    , createUI "Icon" Icon.viewStories
    , createUI "BetIcon" BetIcon.viewStories
    , createUI "BetButton" BetButton.viewStories
    , createUI "CloseIcon" CloseIcon.viewStories
    , createUI "CloseButton" CloseButton.viewStories
    , createUI "Chip" Chip.viewStories
    , createUI "ChipButton" ChipButton.viewStories
    ]


main =
    fromUIs uiCategory
