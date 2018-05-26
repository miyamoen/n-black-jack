module Stories.Atom.Text exposing (viewDescriptionsStories, viewLabelsStories)

import App.Text exposing (..)
import Element exposing (Element, column)
import Element.Attributes exposing (spacing)
import Rocket exposing ((=>))
import Stories.Element exposing (toHtml)
import Styles.Types exposing (FontSize(..), FontStyle(..), Styles(..))
import UIExplorer exposing (renderStories)
import View.Atom.Text exposing (..)


dummyText : String
dummyText =
    "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,"


labels : FontStyle -> Element Styles variation msg
labels fontStyle =
    column None
        [ spacing 20 ]
        [ label fontStyle Large title
        , label fontStyle Medium title
        , label fontStyle Small title
        ]


descriptions : FontStyle -> Element Styles variation msg
descriptions fontStyle =
    description fontStyle [ dummyText, dummyText, dummyText ]


stories : List ( String, FontStyle )
stories =
    [ "Regular" => Regular
    , "RegularItaric" => RegularItaric
    , "Bold" => Bold
    , "BoldItaric" => BoldItaric
    ]


viewLabelsStories =
    renderStories (labels >> toHtml) stories


viewDescriptionsStories =
    renderStories (descriptions >> toHtml) stories
