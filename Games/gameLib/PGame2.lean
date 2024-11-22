

import Mathlib.SetTheory.Game.PGame

import Games.gameLib.Termination

open SetTheory PGame


#check 1

#check PGame




inductive MoveType where
  | ok (type : Type u) (move : type)
  | over

open Classical



noncomputable
def PGame_of_hist (ini : PGame) : List MoveType → PGame
  | [] => ini
  | (.ok type move) :: before =>
      let sofar := PGame_of_hist ini before
      if e1 : type = sofar.LeftMoves
      then
        sofar.moveLeft (by rw [← e1] ; exact move)
      else
        if e2 : type = sofar.RightMoves
        then
          sofar.moveRight (by rw [← e2] ; exact move)
        else
          0
  | .over :: _ => 0


def legalLeft (ini : PGame) (hist : List MoveType) : MoveType → Prop
  | .ok type _ => type = (PGame_of_hist ini hist).LeftMoves
  | .over => True

def legalRight (ini : PGame) (hist : List MoveType) : MoveType → Prop
  | .ok type _ => type = (PGame_of_hist ini hist).RightMoves
  | .over => True


noncomputable
def PGameI (g : PGame) : Game_World PGame (MoveType) where
  init_game_state := g
  fst_win_states := fun hist => ∃ pre, pre <:+ hist ∧ Turn_snd pre.length ∧ PGame_of_hist g hist = 0  -- maybe ∃ suffix isntead of hist directly so that it is playable ?
  snd_win_states := fun hist => ∃ pre, pre <:+ hist ∧ Turn_fst pre.length ∧ PGame_of_hist g hist = 0
  fst_legal := fun hist act => legalRight g hist act
  snd_legal := fun hist act => legalLeft g hist act
  fst_transition := fun hist act => PGame_of_hist g (act :: hist)
  snd_transition := fun hist act => PGame_of_hist g (act :: hist)
