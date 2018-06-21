module Stories.Atom.Text exposing (viewStories)

import Color.Pallet exposing (Pallet(..), pallets)
import Element exposing (Element, column, el)
import Element.Attributes exposing (px, width)
import Rocket exposing ((=>))
import Stories.Element exposing (toHtml, toMain)
import Types.Styles exposing (..)
import Types.Styles.Text exposing (..)
import UIExplorer exposing (renderStories)
import View.Atom.Text as Text exposing (..)


type Width
    = Limited
    | Unlimited


view : Config { width : Width } -> RootElement msg
view config =
    case config.width of
        Unlimited ->
            el None [] <| Text.view config "Black Jack"

        Limited ->
            el None [ width <| px 300 ] <| Text.view config dummyText


default : Config { width : Width }
default =
    { width = Unlimited
    , style = Regular
    , size = Medium
    , line = OneLine
    , align = Center
    , pallet = Black
    , onTable = False
    }


dummyText : String
dummyText =
    "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,"


stories : List ( String, Config { width : Width } )
stories =
    List.concat
        [ List.map
            (\style -> toString style => { default | style = style })
            fontStyles
        , List.map
            (\size -> toString size => { default | size = size })
            sizes
        , List.map
            (\align -> toString align => { default | align = align })
            aligns
        , [ "Ellipsis" => { default | width = Limited }
          , "Wrap" => { default | width = Limited, line = MultiLine }
          , "OnTable" => { default | onTable = True }
          ]
        , List.map
            (\pallet ->
                (toString pallet |> String.words |> String.concat)
                    => { default | pallet = pallet }
            )
            pallets
        ]


viewStories =
    renderStories (view >> toHtml) stories


main =
    toMain viewStories
