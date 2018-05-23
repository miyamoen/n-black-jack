module Stories.Atom exposing (..)

import Stories.Atom.Card as Card
import Stories.Atom.CardBox as CardBox
import Stories.Atom.ChipSvg as ChipSvg
import Stories.Atom.Circle as Circle
import Stories.Atom.Colors as Colors
import Stories.Atom.PointLabel as PointLabel
import Stories.Atom.SimpleChipSvg as SimpleChipSvg
import Stories.Atom.Table as Table
import Stories.Atom.Text as Text
import UIExplorer exposing (UI, createUI)


uiCategory : List UI
uiCategory =
    [ createUI "Colors" Colors.viewStories
    , createUI "Label" Text.viewLabelsStories
    , createUI "Description" Text.viewDescriptionsStories
    , createUI "Table" Table.viewStories
    , createUI "CircleFrame" Circle.viewStories
    , createUI "CardBoxFrame" CardBox.viewStories
    , createUI "ChipSvg" ChipSvg.viewStories
    , createUI "SimpleChipSvg" SimpleChipSvg.viewStories
    , createUI "Card" Card.viewStories
    , createUI "PointLabel" PointLabel.viewStories
    ]
