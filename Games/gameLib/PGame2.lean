

import Mathlib.SetTheory.Game.PGame

import Games.gameLib.Termination
import Games.gameLib.HistoryAPI


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
  | .over => False

def legalRight (ini : PGame) (hist : List MoveType) : MoveType → Prop
  | .ok type _ => type = (PGame_of_hist ini hist).RightMoves
  | .over => False


noncomputable
def PGameI (g : PGame) : Game_World PGame (MoveType) where
  init_game_state := g
  fst_win_states := fun hist => ∃ pre, pre <:+ hist ∧ Turn_snd pre.length ∧ PGame_of_hist g hist = 0  -- maybe ∃ suffix isntead of hist directly so that it is playable ?
  snd_win_states := fun hist => ∃ pre, pre <:+ hist ∧ Turn_fst pre.length ∧ PGame_of_hist g hist = 0
  fst_legal := fun hist act => if PGame_of_hist g hist = 0 then act = .over else legalRight g hist act
  snd_legal := fun hist act => if PGame_of_hist g hist = 0 then act = .over else legalLeft g hist act
  fst_transition := fun hist act => PGame_of_hist g (act :: hist)
  snd_transition := fun hist act => PGame_of_hist g (act :: hist)


lemma PGame_zero_cons (g : PGame) (hist : List MoveType) (act : MoveType) (leg : (PGameI g).hist_legal (act :: hist))
  (zero : (PGame_of_hist g hist) = 0) : (PGame_of_hist g (act :: hist)) = 0 :=
    by
    cases' leg
    rename_i sofar now
    split_ifs at now
    · dsimp [PGameI] at now
      rw [if_pos zero] at now
      rw [now]
      dsimp [PGame_of_hist]
    · dsimp [PGameI] at now
      rw [if_pos zero] at now
      rw [now]
      dsimp [PGame_of_hist]


lemma PGame_zero_suffix (g : PGame) (pre hist : List MoveType) (suff : pre <:+ hist) (leg : (PGameI g).hist_legal (hist))
  (zero : (PGame_of_hist g pre) = 0) : (PGame_of_hist g hist) = 0 :=
    by
    induction' hist with last post ih
    · rw [List.suffix_nil] at suff
      rw [suff] at zero
      apply zero
    · rw [List.suffix_cons_iff] at suff
      cases' suff with q q
      · rw [← q]
        apply zero
      · apply PGame_zero_cons _ _ _ leg
        apply ih q
        cases' leg
        rename_i sofar _
        exact sofar


lemma PGame_ne_zero_of_cons (g : PGame) (hist : List MoveType) (act : MoveType) (leg : (PGameI g).hist_legal (act :: hist))
  (zero : (PGame_of_hist g (act :: hist)) ≠ 0) : (PGame_of_hist g hist) ≠ 0 :=
    by
    contrapose! zero
    apply PGame_zero_cons _ _ _ leg zero


lemma PGame_ne_zero_of_cons_ok (g : PGame) (hist : List MoveType) (type : Type u) (move : type)
  (leg : (PGameI g).hist_legal ((.ok type move) :: hist)) : (PGame_of_hist g hist) ≠ 0 :=
    by
    cases' leg
    rename_i sofar now
    split_ifs at now
    · dsimp [PGameI] at now
      split_ifs at now
      rename_i goal
      exact goal
    · dsimp [PGameI] at now
      split_ifs at now
      rename_i goal
      exact goal


lemma type_left_of_turn_fst (g : PGame) (hist : List MoveType) (type : Type u) (move : type)
  (leg : (PGameI g).hist_legal ((.ok type move) :: hist)) (T : Turn_fst (((.ok type move) :: hist).length + 1)) :
  type = (PGame_of_hist g hist).LeftMoves :=
    by
    rw [List.length_cons] at T
    have leg' := leg
    cases' leg
    rename_i sofar now
    rw [← Turn_fst_step] at T
    rw [if_neg (by rw [← Turn_fst_not_step] ; exact T)] at now
    dsimp [PGameI, legalLeft] at now
    rw [if_neg (PGame_ne_zero_of_cons_ok g hist type move leg')] at now
    exact now

lemma type_right_of_turn_snd (g : PGame) (hist : List MoveType) (type : Type u) (move : type)
  (leg : (PGameI g).hist_legal ((.ok type move) :: hist)) (T : Turn_snd (((.ok type move) :: hist).length + 1)) :
  type = (PGame_of_hist g hist).RightMoves :=
    by
    rw [List.length_cons] at T
    have leg' := leg
    cases' leg
    rename_i sofar now
    rw [if_pos (by rw [Turn_fst_snd_step] ; exact T)] at now
    dsimp [PGameI, legalRight] at now
    rw [if_neg (PGame_ne_zero_of_cons_ok g hist type move leg')] at now
    exact now





#check PGame.zero_le

noncomputable
def preLeftWinStrat (g : PGame) (hg : 0 ≤ g) :
  (hist : List MoveType) → Turn_snd (hist.length +1) → (PGameI g).hist_legal hist → (∀ pre, pre <:+ hist → 0 ≤ (PGame_of_hist g pre)) →
    { act : MoveType // (PGameI g).snd_legal hist act ∧ 0 ≤ (PGame_of_hist g (act :: hist))} :=
  fun hist T leg H =>
    match hist with
    | [] => (by contradiction)
    | last :: before =>
        match last with
        | .over =>
          ⟨.over, And.intro (by dsimp [PGameI, PGame_of_hist] ; rw [if_pos rfl]) (by dsimp [PGame_of_hist] ; exact zero_le_of_isEmpty_rightMoves 0)⟩
        | .ok type move =>
            have R := type_right_of_turn_snd g before type move leg T
            let next := Classical.choose (PGame.zero_le.mp (H before (by exact List.suffix_cons (MoveType.ok type move) before)) (by rw [← R] ; exact move))
            let nextP := Classical.choose_spec (PGame.zero_le.mp (H before (by exact List.suffix_cons (MoveType.ok type move) before)) (by rw [← R] ; exact move))
            if O : PGame_of_hist g ((.ok type move) :: before) = 0
            then -- shouldn't happen thouhgh
              ⟨.over, And.intro (by dsimp [PGameI, PGame_of_hist] ; rw [if_pos]) (by dsimp [PGame_of_hist] ; exact zero_le_of_isEmpty_rightMoves 0)⟩
            else
              by
              refine' ⟨ MoveType.ok _ next, _, _⟩
              · dsimp [PGameI]




#exit



def leftWinStrat (g : PGame) (hg : 0 ≤ g) : (PGameI g).sStrategy :=
  fun hist T leg =>
    let x := PGame_of_hist g hist
    sorry
