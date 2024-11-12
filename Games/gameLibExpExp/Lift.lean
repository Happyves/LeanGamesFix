/-
Copyright (c) 2024 Yves Jäckle. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Yves Jäckle.
-/

import Games.gameLibExpExp.Basic
import Games.gameLib.HistoryAPI
import Games.gameLib.CoherentEnd


def Game_World.lift (g : Game_World α β) [Inhabited α]
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states)]
  [∀ hist, DecidablePred (g.fst_legal hist)] [∀ hist, DecidablePred (g.snd_legal hist)]
  : Game_World α β :=
  {init_game_state := g.init_game_state
   fst_win_states := fun hist => ∃ pre, pre <:+ hist ∧ g.fst_win_states pre
   snd_win_states := fun hist => ∃ pre, pre <:+ hist ∧ g.snd_win_states pre
   fst_legal := fun hist act =>
      if g.hist_legal hist ∧ g.hist_neutral hist
      then g.fst_legal hist act
      else True
   snd_legal := fun hist act =>
      if g.hist_legal hist ∧ g.hist_neutral hist
      then g.snd_legal hist act
      else True
   fst_transition := fun hist act =>
      if g.hist_legal hist ∧ g.hist_neutral hist
      then g.fst_transition hist act
      else default
   snd_transition := fun hist act =>
      if g.hist_legal hist ∧ g.hist_neutral hist
      then g.snd_transition hist act
      else default
  }




lemma Game_World.lift_hist_neutral_of_cons (g : Game_World α β) [Inhabited α]
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )]
  [∀ hist, DecidablePred (g.fst_legal hist)] [∀ hist, DecidablePred (g.snd_legal hist)]
  {hist : List β} {act : β} (main : g.lift.hist_neutral (act :: hist)) :
  g.lift.hist_neutral ( hist) :=
  by
  constructor
  · intro ⟨pre,suf,win⟩
    apply main.not_fst
    use pre
    constructor
    · rw [List.suffix_cons_iff]
      right
      exact suf
    · exact win
  · intro ⟨pre,suf,win⟩
    apply main.not_snd
    use pre
    constructor
    · rw [List.suffix_cons_iff]
      right
      exact suf
    · exact win



lemma Game_World.lift_hist_neutral (g : Game_World α β) [Inhabited α]
   [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )]
   [∀ hist, DecidablePred (g.fst_legal hist)] [∀ hist, DecidablePred (g.snd_legal hist)]
   {hist : List β} (main : g.lift.hist_neutral hist) : g.hist_neutral hist :=
   by
   contrapose main
   have : g.fst_win_states hist ∨ g.snd_win_states hist  :=
      by by_contra hmm ; rw [not_or] at hmm ; apply main ⟨hmm.1, hmm.2 ⟩
   cases' this with F S
   · intro con
     apply con.not_fst
     use hist
     constructor
     · exact Exists.intro [] rfl
     · exact F
   · intro con
     apply con.not_snd
     use hist
     constructor
     · exact Exists.intro [] rfl
     · exact S

lemma Game_World.hist_neutral_lift (g : Game_World α β) [Inhabited α]
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )]
  [∀ hist, DecidablePred (g.fst_legal hist)] [∀ hist, DecidablePred (g.snd_legal hist)]
  {hist : List β} (ce : g.coherent_end) (leg : g.hist_legal hist)
  (main : g.hist_neutral hist) : g.lift.hist_neutral hist :=
  by
  contrapose main
  have : g.lift.fst_win_states hist ∨ g.lift.snd_win_states hist  :=
    by by_contra hmm ; rw [not_or] at hmm ; apply main ⟨hmm.1, hmm.2 ⟩
  cases' this with F S
  · intro con
    apply con.not_fst
    obtain ⟨pre, inter, prew⟩ := F
    obtain ⟨rest, restp⟩ := inter
    rw [← restp]
    apply g.coherent_end_all_fst ce _ prew _ (by rw [restp] ; exact leg)
  · intro con
    apply con.not_snd
    obtain ⟨pre, inter, prew⟩ := S
    obtain ⟨rest, restp⟩ := inter
    rw [← restp]
    apply g.coherent_end_all_snd ce _ prew _ (by rw [restp] ; exact leg)




lemma Game_World.lift_hist_legal (g : Game_World α β) [Inhabited α]
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )]
  [∀ hist, DecidablePred (g.fst_legal hist)] [∀ hist, DecidablePred (g.snd_legal hist)]
  {hist : List β} (main : g.lift.hist_legal hist) (N : g.lift.hist_neutral hist) : g.hist_legal hist :=
  by
  induction' hist with x l ih
  · apply Game_World.hist_legal.nil
  · cases' main
    rename_i sofar now
    split_ifs at now with T
    · apply Game_World.hist_legal.cons _ _ _ (ih sofar (g.lift_hist_neutral_of_cons N))
      rw [if_pos T]
      dsimp [lift] at now
      rwa [if_pos ⟨(ih sofar (g.lift_hist_neutral_of_cons N)), (g.lift_hist_neutral (g.lift_hist_neutral_of_cons N))⟩] at now
    · apply Game_World.hist_legal.cons _ _ _ (ih sofar (g.lift_hist_neutral_of_cons N))
      rw [if_neg T]
      dsimp [lift] at now
      rwa [if_pos ⟨(ih sofar (g.lift_hist_neutral_of_cons N)), (g.lift_hist_neutral (g.lift_hist_neutral_of_cons N))⟩] at now




lemma Game_World.hist_legal_lift (g : Game_World α β) [Inhabited α]
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )]
  [∀ hist, DecidablePred (g.fst_legal hist)] [∀ hist, DecidablePred (g.snd_legal hist)]
  {hist : List β} (main : g.hist_legal hist) : g.lift.hist_legal hist :=
  by
  induction' hist with x l ih
  · apply Game_World.hist_legal.nil
  · cases' main
    rename_i sofar now
    split_ifs at now with T
    · apply Game_World.hist_legal.cons _ _ _ (ih sofar)
      rw [if_pos T]
      dsimp [lift]
      simp only [if_true_right_eq_or]
      right
      exact now
    · apply Game_World.hist_legal.cons _ _ _ (ih sofar)
      rw [if_neg T]
      dsimp [lift]
      simp only [if_true_right_eq_or]
      right
      exact now



def Game_World.liftF (g : Game_World α β) [Inhabited α] [Inhabited β]
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )]
  [∀ hist, DecidablePred (g.fst_legal hist)] [∀ hist, DecidablePred (g.snd_legal hist)]
  [DecidablePred (g.lift.fst_win_states)] [DecidablePred (g.lift.snd_win_states)]
  (ce : g.coherent_end)
  (fs : g.cfStrategy) : g.lift.fStrategy :=
  fun hist T leg =>
    if N : g.lift.hist_neutral hist
    then
      let ⟨v, p⟩ := fs hist T (g.lift_hist_legal leg N) (g.lift_hist_neutral N)
      have : g.lift.fst_legal hist v := by
        dsimp [lift]; rw [if_pos ⟨(g.lift_hist_legal leg N), (g.lift_hist_neutral N)⟩]; exact p
      ⟨v,this⟩
    else ⟨default,
      (by dsimp [lift]
          rw [if_neg]
          · trivial
          · push_neg
            intro L
            contrapose! N
            exact g.hist_neutral_lift ce L N
            )⟩


def Game_World.liftS (g : Game_World α β) [Inhabited α] [Inhabited β]
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )]
  [∀ hist, DecidablePred (g.fst_legal hist)] [∀ hist, DecidablePred (g.snd_legal hist)]
  [DecidablePred (g.lift.fst_win_states)] [DecidablePred (g.lift.snd_win_states)]
  (ce : g.coherent_end)
  (fs : g.csStrategy) : g.lift.sStrategy :=
  fun hist T leg =>
    if N : g.lift.hist_neutral hist
    then
      let ⟨v, p⟩ := fs hist T (g.lift_hist_legal leg N) (g.lift_hist_neutral N)
      have : g.lift.snd_legal hist v := by
        dsimp [lift]; rw [if_pos ⟨(g.lift_hist_legal leg N), (g.lift_hist_neutral N)⟩]; exact p
      ⟨v,this⟩
    else ⟨default,
      (by dsimp [lift]
          rw [if_neg]
          · trivial
          · push_neg
            intro L
            contrapose! N
            exact g.hist_neutral_lift ce L N
            )⟩
