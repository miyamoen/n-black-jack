module Main exposing (..)

import Stories.Atom as Atom
import Stories.Molecule as Molecule
import Stories.Organism as Organism
import UIExplorer exposing (addUICategory, app, emptyUICategories)


main =
    emptyUICategories
        |> addUICategory "Atom" Atom.uiCategory
        |> addUICategory "Molecule" Molecule.uiCategory
        |> addUICategory "Organism" Organism.uiCategory
        |> app
