module Stories.Molecule.Text.Chip exposing (viewStories)

import Color.Pallet exposing (Pallet(Black))
import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtmlWithSymbol)
import Types.Styles.Text exposing (Size(Medium), sizes)
import UIExplorer exposing (renderStories)
import View.Molecule.Text.Chip exposing (Config, view)


stories : List ( String, ( Config {}, Float ) )
stories =
    List.concat
        [ List.map
            (\chip ->
                toString chip
                    => ( default Medium, chip )
            )
            [ 0, 1, 10, 50, 100, 500, 1000, 10000 ]
        , List.map
            (\size -> toString size => ( default size, 50 ))
            sizes
        ]


default : Size -> Config {}
default size =
    { size = size, pallet = Just Black, onTable = False }


viewStories =
    renderStories (uncurry view >> toHtmlWithSymbol) stories


main =
    fromStories viewStories
