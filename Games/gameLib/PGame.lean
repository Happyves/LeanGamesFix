

import Mathlib.SetTheory.Game.PGame

import Games.gameLib.Termination

open SetTheory


#check 1

#check PGame


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
def PGame_of_hist (ini : PGame) (hist : List (MoveType ini)) (leg : ListMoveTypeLegal ini hist) : PGame :=
  Classical.choose leg



noncomputable
def PGameI (g : PGame) : Symm_Game_World PGame (MoveType g) where
  init_game_state := g
  fst_win_states := fun hist => Turn_snd hist.length ∧ preListMoveTypeLegal g 0 hist
  snd_win_states := fun hist => Turn_snd hist.length ∧ preListMoveTypeLegal g 0 hist
  law := fun hist act => ListMoveTypeLegal g (act :: hist)
  transition := fun hist act =>
    if L : ListMoveTypeLegal g (act :: hist)
    then PGame_of_hist g (act :: hist) L
    else 0


lemma PGame_of_hist_legal_of_cons (ini : PGame) (act : MoveType ini) (hist : List (MoveType ini))
  (leg : ListMoveTypeLegal ini (act :: hist)) : ListMoveTypeLegal ini hist :=
  by
  obtain ⟨G,Gdef⟩ := leg
  cases' Gdef
  · rename_i G lT TT ts leg
    use G
  · rename_i G lT TT ts leg
    use G


def PGame_of_hist' (ini : PGame) (hist : List (MoveType ini)) (leg : ListMoveTypeLegal ini hist) : PGame :=
  match hist with
  | [] => ini
  | last :: before =>
      let sofar := PGame_of_hist' ini before (PGame_of_hist_legal_of_cons ini last before leg)




#exit


lemma PGame_of_hist_prop (ini : PGame) (hist : List (MoveType ini)) (leg : ListMoveTypeLegal ini hist) :
  preListMoveTypeLegal ini (PGame_of_hist ini hist leg) hist :=
  Classical.choose_spec leg



lemma PGame_of_hist_unique (ini : PGame) (hist : List (MoveType ini)) (leg : ListMoveTypeLegal ini hist)
  {G : PGame} (hG : preListMoveTypeLegal ini G hist) : G = (PGame_of_hist ini hist leg) :=
  by
  induction' hist with last hs ih
  · cases' hG
    rw [PGame_of_hist]
    obtain ⟨G,Gdef⟩ := leg
    cases' Gdef
    ·



def PGame_of_hist_cons_fst (ini : PGame) (act : MoveType ini) (hist : List (MoveType ini))
  (leg : ListMoveTypeLegal ini (act :: hist)) (T : Turn_fst hist.length) :
  act.type = (PGame_of_hist ini hist (PGame_of_hist_legal_of_cons ini act hist leg)).RightMoves :=
  by
  obtain ⟨G,Gdef⟩ := leg
  cases' Gdef
  · rename_i G lT TT ts leg
    contradiction
  · rename_i G lT TT ts leg
    dsimp



#exit


#check PGame.zero_le

#check PGame.moveRecOn


def leftWinStrat (g : PGame) (hg : 0 ≤ g) : (PGameI g).sStrategy :=
  fun hist T leg => sorry



#exit

theorem theRelation (g : PGame) :
  0 ≤ g ↔ (PGameI g).is_snd_win :=
  by
  constructor
  · intro pgw
