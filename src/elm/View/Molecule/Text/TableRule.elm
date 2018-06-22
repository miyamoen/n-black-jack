module View.Molecule.Text.TableRule exposing (view)

import App.Text exposing (dealerRule, payRule)
import Types exposing (Phase(..))
import Types.Styles exposing (RootElement)
import Types.Styles.Text exposing (Align(..), Line(..), Size(..))
import View.Atom.Text.OnTable as TextOnTable


view : Phase -> RootElement msg
view phase =
    case phase of
        WaitingBet ->
            text payRule

        DealingCards ->
            text dealerRule

        PlayerAction ->
            text dealerRule

        DealerAction ->
            text dealerRule

        WaitingNextGame ->
            text payRule


text : String -> RootElement msg
text =
    TextOnTable.view { size = Large, line = MultiLine, align = Center }
