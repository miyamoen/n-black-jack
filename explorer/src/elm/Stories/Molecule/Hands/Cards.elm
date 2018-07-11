module Stories.Molecule.Hands.Cards exposing (viewStories)

import Stories.Dummy as Dummy
import Stories.Utils exposing (fromStories, toHtmlWithSymbol)
import UIExplorer exposing (renderStories)
import View.Molecule.Hands.Cards exposing (Data, view)


stories : List ( String, Data {} )
stories =
    Dummy.cards
        |> List.map (Tuple.mapSecond (\cards -> { cards = cards }))


viewStories =
    renderStories (view >> toHtmlWithSymbol) stories


main =
    fromStories viewStories
