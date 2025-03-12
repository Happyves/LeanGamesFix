import Games.exLib.Nat
import Games.exLib.List
import Games.exLib.General
import Games.exLib.Versioning

import Games.gameLib.Basic
import Games.gameLib.CoherentEnd
import Games.gameLib.ConwayInduction
import Games.gameLib.HistoryAPI
import Games.gameLib.HistoryMoves
import Games.gameLib.Pairing
import Games.gameLib.Playability
import Games.gameLib.Positional
import Games.gameLib.StateAPI
import Games.gameLib.Stealing
import Games.gameLib.StrategyAPI
import Games.gameLib.Termination
import Games.gameLib.TurnAPI
import Games.gameLib.Zermelo

import Games.games.Chomp
import Games.games.PickUpBricks
import Games.games.TicTacToe
import Games.games.TTT_CombinatorialLines




-- # Basics

#check Game_World

#check PickUpBricks

#check Game_World.fStrategy
#check Game_World.hist_legal

#check pub_win_strat

#check Game

#check Game.hist_on_turn

#check Game_World.Turn_isWL

#check Game_World.isWL

#check Game_World.state_on_turn_neutral

#check Game.fst_win

#check Game_World.is_fst_win


#check loop_invariant

#check PUB_snd_win

-- # Zermelo and Chomp

#check Game_World.Zermelo

#check preChomp
#check Chomp

#check Game_World.playable

#check preChomp_playable

#check Game_World.coherent_end

#check preChomp_coherent_end

#check preChomp_isWL

#check Rdef

#check Game_World.ConwayInduction


-- # Strategy Stealing

#check Bait

#check Stealing_condition

#check stolen_strat

#check pre_stolen_strat

#check History_of_stealing

#check Strategy_stealing

#check domi
#check nondomi

#check Chomp_state

#check Chomp_init

#check Chomp_law

#check Chomp_win_final

#check Chomp_win_fst

#check Chomp_is_fst_win


-- # If time allows: Tic-Tac-Toe, Positional Games, Pairing strategies


#check Positional_Game_World

#check PosGame_trans

#check PosGame_win_fst

#check Pairing_condition

#check pairProp

#check pairDif

#check Pairing_StratCore

#check Pairing_Strategy
