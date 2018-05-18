module Main exposing (..)

import Stories.Atom as Atom
import UIExplorer exposing (addUICategory, app, emptyUICategories)


main =
    emptyUICategories
        |> addUICategory "Atom" Atom.uiCategory
        |> app
