

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
      if e1 : type = sofar.LeftMoves ∧ Turn_snd (((.ok type move) :: before).length)
      then
        sofar.moveLeft (by rw [← e1.1] ; exact move)
      else
        if e2 : type = sofar.RightMoves ∧ Turn_fst (((.ok type move) :: before).length)
        then
          sofar.moveRight (by rw [← e2.1] ; exact move)
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
  fst_win_states := fun hist => ∃ pre, pre <:+ hist ∧ Turn_snd pre.length ∧ PGame_of_hist g hist = 0
  snd_win_states := fun hist => ∃ pre, pre <:+ hist ∧ Turn_fst pre.length ∧ PGame_of_hist g hist = 0
  fst_legal := fun hist act => if ¬ Nonempty (PGame_of_hist g hist).RightMoves then act = .over else legalRight g hist act
  snd_legal := fun hist act => if ¬ Nonempty (PGame_of_hist g hist).LeftMoves then act = .over else legalLeft g hist act
  fst_transition := fun hist act => PGame_of_hist g (act :: hist)
  snd_transition := fun hist act => PGame_of_hist g (act :: hist)




lemma type_left_of_turn_fst (g : PGame) (hist : List MoveType) (type : Type u) (move : type)
  (leg : (PGameI g).hist_legal ((.ok type move) :: hist)) (T : Turn_fst (((.ok type move) :: hist).length + 1)) :
  type = (PGame_of_hist g hist).LeftMoves :=
    by
    rw [List.length_cons] at T
    cases' leg
    rename_i sofar now
    rw [← Turn_fst_step] at T
    rw [if_neg (by rw [← Turn_fst_not_step] ; exact T)] at now
    dsimp [PGameI, legalLeft] at now
    rw [if_neg] at now
    · exact now
    · intro con
      rw [if_pos con] at now
      contradiction


lemma type_right_of_turn_snd (g : PGame) (hist : List MoveType) (type : Type u) (move : type)
  (leg : (PGameI g).hist_legal ((.ok type move) :: hist)) (T : Turn_snd (((.ok type move) :: hist).length + 1)) :
  type = (PGame_of_hist g hist).RightMoves :=
    by
    rw [List.length_cons] at T
    cases' leg
    rename_i sofar now
    rw [if_pos (by rw [Turn_fst_snd_step] ; exact T)] at now
    dsimp [PGameI, legalRight] at now
    rw [if_neg] at now
    · exact now
    · intro con
      rw [if_pos con] at now
      contradiction





#check PGame.zero_le

noncomputable
def preLeftWinStrat (g : PGame) :
  (hist : List MoveType) → Turn_snd (hist.length + 1) → (PGameI g).hist_legal hist → (∀ pre, pre <:+ hist → Turn_snd pre.length → 0 ≤ (PGame_of_hist g pre)) →
    { act : MoveType // (PGameI g).snd_legal hist act ∧ 0 ≤ (PGame_of_hist g (act :: hist))} :=
  fun hist T leg H =>
    match hist with
    | [] => (by contradiction)
    | last :: before =>
        match last with
        | .over =>
          ⟨.over, And.intro (by dsimp [PGameI, PGame_of_hist] ; rw [if_pos not_nonempty_pempty]) (by dsimp [PGame_of_hist] ; exact zero_le_of_isEmpty_rightMoves 0)⟩
        | .ok type move =>
            have R := type_right_of_turn_snd g before type move leg T
            let next := Classical.choose (PGame.zero_le.mp (H before (by exact List.suffix_cons (MoveType.ok type move) before) (by rw [Turn_snd_step] ; apply T)) (by rw [← R] ; exact move))
            let nextP := Classical.choose_spec (PGame.zero_le.mp (H before (by exact List.suffix_cons (MoveType.ok type move) before) (by rw [Turn_snd_step] ; apply T)) (by rw [← R] ; exact move))
            if O : ¬ Nonempty (PGame_of_hist g (MoveType.ok type move :: before)).LeftMoves
            then -- shouldn't happen though
              ⟨.over, And.intro (by dsimp [PGameI] ; rw [if_pos O]) (by dsimp [PGame_of_hist] ; exact zero_le_of_isEmpty_rightMoves 0)⟩
            else
              by
              have help : moveRight (PGame_of_hist g before) (cast (@Eq.symm (Type _) (RightMoves (PGame_of_hist g before)) type
                  (R.symm ▸ Eq.refl (RightMoves (PGame_of_hist g before)))) move) =
                  PGame_of_hist g (MoveType.ok type move :: before) :=
                    by
                    dsimp [PGame_of_hist]
                    rw [dif_neg (by apply not_and_of_not_right ; rw [Turn_snd_not_step, not_not] ; apply T ), dif_pos ⟨R, (by rw [Turn_fst_snd_step] ; apply T)⟩]
              refine' ⟨ MoveType.ok _ next, _, _⟩
              · dsimp [PGameI]
                rw [if_neg O]
                dsimp [legalLeft]
                rw [help]
              · unfold PGame_of_hist
                rw [dif_pos (And.intro (by congr) (by apply T))]
                convert nextP
                · rw [← help]
                  rfl
                · dsimp
                  apply cast_heq

#check 1

noncomputable
def leftWinStrat (g : PGame) : (PGameI g).sStrategy :=
  fun hist T leg =>
    match hist with
    | [] => (by contradiction)
    | last :: before =>
        match last with
        | .over =>
          ⟨.over, (by dsimp [PGameI, PGame_of_hist] ; rw [if_pos not_nonempty_pempty])⟩
        | .ok type move =>
            if O : ¬ Nonempty (PGame_of_hist g (MoveType.ok type move :: before)).LeftMoves
            then -- shouldn't happen though
              ⟨.over, (by dsimp [PGameI] ; rw [if_pos O])⟩
            else
              if H : ∀ pre, pre <:+ (MoveType.ok type move :: before) → Turn_snd pre.length → 0 ≤ (PGame_of_hist g pre)
              then
                have R := type_right_of_turn_snd g before type move leg T
                let next := Classical.choose (PGame.zero_le.mp (H before (by exact List.suffix_cons (MoveType.ok type move) before) (by rw [Turn_snd_step] ; apply T)) (by rw [← R] ; exact move))
                have help : moveRight (PGame_of_hist g before) (cast (@Eq.symm (Type _) (RightMoves (PGame_of_hist g before)) type
                  (R.symm ▸ Eq.refl (RightMoves (PGame_of_hist g before)))) move) =
                  PGame_of_hist g (MoveType.ok type move :: before) :=
                    by
                    dsimp [PGame_of_hist]
                    rw [dif_neg (by apply not_and_of_not_right ; rw [Turn_snd_not_step, not_not] ; apply T ), dif_pos ⟨R, (by rw [Turn_fst_snd_step] ; apply T)⟩]
                ⟨MoveType.ok _ next,(by dsimp [PGameI] ; rw [if_neg O] ; dsimp [legalLeft] ; rw [help])⟩
              else -- shouldn't happen though
                by
                rw [not_not] at O
                exact ⟨MoveType.ok _ (Classical.choice O),(by dsimp [PGameI] ; rw [if_neg (by rw [not_not] ; exact O)] ; dsimp [legalLeft])⟩

#check Empty
#check Nonempty
#check Classical.choice

theorem the_relations (g : PGame) :
  0 ≤ g ↔ (PGameI g).is_snd_win :=
  by
  constructor
  · sorry
  · rintro ⟨ws,ws_prop⟩
    sorry
    /-
    The Plan:
    Use a first strategy on `ws_prop`. We get the fact that there exists a turn on which
    the second predicate winning pre is satistfied, and hence a hist `pre` of
    -/
