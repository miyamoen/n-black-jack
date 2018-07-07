module Stories.Molecule.Bet.Undos exposing (viewStories)

import Rocket exposing ((=>))
import Stories.Utils exposing (fromStories, toHtml)
import Types.Styles.Text exposing (Size(..))
import UIExplorer exposing (renderStories)
import View.Molecule.Bet.Undos exposing (Config, view)


stories : List ( String, ( Config {}, List Int ) )
stories =
    [ "default" => ( { size = Small }, [ 0, 100, 50 ] )
    , "empty" => ( { size = Small }, [] )
    , "Tiny" => ( { size = Tiny }, [ 0, 100, 50 ] )
    , "Small" => ( { size = Small }, [ 0, 100, 50 ] )
    , "Normal" => ( { size = Normal }, [ 0, 100, 50 ] )
    , "Medium" => ( { size = Medium }, [ 0, 100, 50 ] )
    , "Large" => ( { size = Large }, [ 0, 100, 50 ] )
    , "Huge" => ( { size = Huge }, [ 0, 100, 50 ] )
    ]


viewStories =
    renderStories (uncurry view >> toHtml) stories


main =
    fromStories viewStories
