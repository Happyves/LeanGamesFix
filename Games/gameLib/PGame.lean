

import Mathlib.SetTheory.Game.PGame

import Games.gameLib.Termination

open SetTheory


#check 1

#check PGame.rec
#check PGame.moveRecOn


inductive isMoveType : PGame → Type u → Prop where
| ofLeft g : isMoveType g (g.LeftMoves)
| ofRight g : isMoveType g (g.RightMoves)
| ofPostLeft g T (m : g.LeftMoves) (proof : isMoveType (g.moveLeft m) T) : isMoveType g T
| ofPostRight g T (m : g.RightMoves) (proof : isMoveType (g.moveRight m) T) : isMoveType g T


structure MoveType (g : PGame) where
  type : Type u
  isMT : isMoveType g type
  move : type


inductive preListMoveTypeLegal (g : PGame) : PGame → List (MoveType g) → Prop where
| nil : preListMoveTypeLegal g g []
| consLeft G (tail : List (MoveType g)) (tf : Turn_snd tail.length) -- assumes Left goes second!
      (tail_leg : preListMoveTypeLegal g G tail) (m : G.LeftMoves)
      (h : isMoveType g G.LeftMoves) :
        preListMoveTypeLegal g (G.moveLeft m) (⟨G.LeftMoves, h, m⟩ :: tail)
| consRight G (tail : List (MoveType g)) (tf : Turn_fst tail.length)
      (tail_leg : preListMoveTypeLegal g G tail) (m : G.RightMoves)
      (h : isMoveType g G.RightMoves) :
        preListMoveTypeLegal g (G.moveRight m) (⟨G.RightMoves, h, m⟩ :: tail)

def ListMoveTypeLegal (g : PGame) (ms : List (MoveType g)) : Prop :=
  ∃ G : PGame, preListMoveTypeLegal g G ms

open Classical

noncomputable
def PGameI (g : PGame) : Symm_Game_World PGame (MoveType g) where
  init_game_state := g
  fst_win_states := fun hist => Turn_snd hist.length ∧ preListMoveTypeLegal g 0 hist
  snd_win_states := fun hist => Turn_snd hist.length ∧ preListMoveTypeLegal g 0 hist
  law := fun hist act => ListMoveTypeLegal g (act :: hist)
  transition := fun hist act =>
    if L : ListMoveTypeLegal g (act :: hist)
    then Classical.choose L
    else 0


theorem theRelation (g : PGame) :
  0 ≤ g ↔ (PGameI g).is_snd_win :=
  by
  sorry
