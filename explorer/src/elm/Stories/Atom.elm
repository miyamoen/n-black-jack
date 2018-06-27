module Stories.Atom exposing (..)

import Stories.Atom.Avatar as Avatar
import Stories.Atom.Button as Button
import Stories.Atom.Button.WithLabel as ButtonWithLabel
import Stories.Atom.Card as Card
import Stories.Atom.Icon as Icon
import Stories.Atom.Layout.Modal as Modal
import Stories.Atom.Selector as Selector
import Stories.Atom.Styles.Color as Color
import Stories.Atom.Styles.Frame as Frame
import Stories.Atom.Styles.TableBoard as TableBoard
import Stories.Atom.Symbol as Symbol
import Stories.Atom.Text as Text
import Stories.Atom.Text.OnTable as TextOnTable
import Stories.Utils exposing (fromUIs)
import UIExplorer exposing (UI, createUI)


uiCategory : List UI
uiCategory =
    [ createUI "Color" Color.viewStories
    , createUI "Frame" Frame.viewStories
    , createUI "TableBoard" TableBoard.viewStories
    , createUI "Modal" Modal.viewStories
    , createUI "Symbol" Symbol.viewStories
    , createUI "Card" Card.viewStories
    , createUI "Text" Text.viewStories
    , createUI "TextOnTable" TextOnTable.viewStories
    , createUI "Button" Button.viewStories
    , createUI "ButtonWithLabel" ButtonWithLabel.viewStories
    , createUI "Selector" Selector.viewStories
    , createUI "Avatar" Avatar.viewStories
    , createUI "Icon" Icon.viewStories
    ]


main =
    fromUIs uiCategory
