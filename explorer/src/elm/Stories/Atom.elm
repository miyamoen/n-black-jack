module Stories.Atom exposing (..)

import Stories.Atom.ActionButton as ActionButton
import Stories.Atom.Avatar as Avatar
import Stories.Atom.Button as Button
import Stories.Atom.Card as Card
import Stories.Atom.Chip as Chip
import Stories.Atom.ChipButton as ChipButton
import Stories.Atom.ChipLabel as ChipLabel
import Stories.Atom.Color as Color
import Stories.Atom.Frame as Frame
import Stories.Atom.Icon as Icon
import Stories.Atom.Modal as Modal
import Stories.Atom.PlainChip as PlainChip
import Stories.Atom.PointLabel as PointLabel
import Stories.Atom.SimpleChipSvg as SimpleChipSvg
import Stories.Atom.TableRule as TableRule
import Stories.Atom.TableText as TableText
import Stories.Atom.Text as Text
import UIExplorer exposing (UI, createUI)


uiCategory : List UI
uiCategory =
    [ createUI "Color" Color.viewStories
    , createUI "Modal" Modal.viewStories
    , createUI "Label" Text.viewLabelsStories
    , createUI "Description" Text.viewDescriptionsStories
    , createUI "Icon" Icon.viewStories
    , createUI "Frame" Frame.viewStories
    , createUI "Chip" Chip.viewStories
    , createUI "PlainChip" PlainChip.viewStories
    , createUI "SimpleChipSvg" SimpleChipSvg.viewStories
    , createUI "Card" Card.viewStories
    , createUI "PointLabel" PointLabel.viewStories
    , createUI "TableText" TableText.viewStories
    , createUI "TableRule" TableRule.viewStories
    , createUI "ChipLabel" ChipLabel.viewStories
    , createUI "Button" Button.viewStories
    , createUI "ActionButton" ActionButton.viewStories
    , createUI "ChipButton" ChipButton.viewStories
    , createUI "Avatar" Avatar.viewStories
    ]
