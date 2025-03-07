
/-
Copyright (c) 2024 Yves Jäckle. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Yves Jäckle.
-/


import Games.gameLib.StrategyAPI
import Games.gameLib.HistoryMoves
import Games.gameLib.CoherentEnd
import Games.exLib.General


/-
This file proves "Conway induction": if a property true for a given
history of moves is also true for all histories extending it by a move
such that the extention is legal and the state of the game is neutral,
then it is true for any history of moves.
The main theorem is `ConwayInduction`

-/


structure Rdef (g : Game_World α β) (h H : List β) : Prop where
  extend : ∃ a, H = a :: h
  neutral : g.hist_neutral H
  leg : g.hist_legal H


def R  (g : Game_World α β) : List β → List β → Prop := fun H h =>  Rdef g h H


lemma Rdef_leg (g : Game_World α β) (h H : List β) (main : Rdef g h H) : g.hist_legal h :=
  by
  obtain ⟨a, m⟩ := main.extend
  replace main := main.leg
  rw [m] at main
  cases' main
  rename_i now sofar
  exact now


lemma Rdef_neutral (g : Game_World α β) (hgn : g.coherent_end) (h H : List β) (main : Rdef g h H) :
  g.hist_neutral h :=
  by
  rw [g.hist_neutral_and, ← not_or]
  intro con
  cases' con with con con
  · have := hgn.fst h (Rdef_leg g h H main) con
    obtain ⟨a,adef⟩ := main.extend
    have that := main.leg
    rw [adef] at that
    cases' that
    rename_i _ now
    split_ifs at now with T
    · replace this := (this a) ⟨fun _ => now, fun no => by exfalso ; rw [Turn_snd_iff_not_fst] at no ; exact no T⟩
      replace main := main.neutral
      rw [g.hist_neutral_and, adef] at main
      exact main.1 this
    · replace this := (this a) ⟨fun no => by exfalso ; exact T no, fun _ => now⟩
      replace main := main.neutral
      rw [g.hist_neutral_and, adef] at main
      exact main.1 this
  · have := hgn.snd h (Rdef_leg g h H main) con
    obtain ⟨a,adef⟩ := main.extend
    have that := main.leg
    rw [adef] at that
    cases' that
    rename_i _ now
    split_ifs at now with T
    · replace this := (this a) ⟨fun _ => now, fun no => by exfalso ; rw [Turn_snd_iff_not_fst] at no ; exact no T⟩
      replace main := main.neutral
      rw [g.hist_neutral_and, adef] at main
      exact main.2 this
    · replace this := (this a) ⟨fun no => by exfalso ; exact T no, fun _ => now⟩
      replace main := main.neutral
      rw [g.hist_neutral_and, adef] at main
      exact main.2 this


lemma wfR_hist_small [DecidableEq β] (h : List β)
  (Y : ℕ → List β) (Yne : ∀ (n : ℕ), Y (n + 1) ≠ []) :
  let moves : ℕ → β := fun n => if Q : n < List.length h then List.rget h { val := n, isLt := Q } else List.head (Y (n - List.length h + 1)) (Yne (n - List.length h))
  ∀ (t : ℕ), t < List.length h → (Hist_from_moves moves t) = h.rtake t :=
  by
  intro moves t tb
  induction' t with t ih
  · rw [Hist_from_moves_zero, List.rtake_zero]
  · rw [Hist_from_moves_succ]
    have : t < List.length h := lt_trans (Nat.lt_succ_self t) tb
    rw [@List.rget_cons_rtake _ _ ⟨t, this⟩, ih this]
    congr
    dsimp [moves]
    rw [dif_pos this]

lemma wfR_hist_big [DecidableEq β] (h : List β)
  (Y : ℕ → List β) (Y0 : Y 0 = h) (Yp : ∀ (n : ℕ), R g (Y (n + 1)) (Y n)) (Yne : ∀ (n : ℕ), Y (n + 1) ≠ []) :
  let moves : ℕ → β := fun n => if Q : n < List.length h then List.rget h { val := n, isLt := Q } else List.head (Y (n - List.length h + 1)) (Yne (n - List.length h))
  ∀ (t : ℕ), t ≥ List.length h → (Hist_from_moves moves t) = Y (t - List.length h) :=
  by
  intro moves t tb
  induction' t with t ih
  · simp_rw [Nat.le_zero, List.length_eq_zero] at tb
    simp_rw [tb] at *
    rw [Hist_from_moves_zero]
    dsimp
    exact Y0.symm
  · rw [Hist_from_moves_succ]
    by_cases q : t+1 > h.length
    · have : t ≥ h.length := by simp_rw [Nat.lt_succ] at q ; apply q
      rw [Nat.succ_sub this]
      obtain ⟨a, Yh⟩ := (Yp (t - h.length)).extend
      rw [Yh, ih this]
      congr
      dsimp [moves]
      rw [dif_neg (by rw [not_lt] ; apply this)]
      simp_rw [Yh, List.head_cons]
    · have := eq_of_ge_of_not_gt tb q
      have that : t < h.length := by rw [← this] ; apply (Nat.lt_succ_self t)
      rw [wfR_hist_small h Y Yne _ that]
      dsimp [moves]
      rw [dif_pos that, ← @List.rget_cons_rtake _ _ ⟨t, that⟩, this, Nat.sub_self, Y0]
      convert List.rtake_length

lemma wfR_legal [DecidableEq β] (g : Game_World α β) (h : List β)
  (Y : ℕ → List β) (Y0 : Y 0 = h) (Yp : ∀ (n : ℕ), R g (Y (n + 1)) (Y n)) (Yne : ∀ (n : ℕ), Y (n + 1) ≠ []) :
  let moves : ℕ → β := fun n => if Q : n < List.length h then List.rget h { val := n, isLt := Q } else List.head (Y (n - List.length h + 1)) (Yne (n - List.length h))
  ∀ (t : ℕ), g.hist_legal (Hist_from_moves moves t) :=
  by
  intro moves t
  by_cases q : t < List.length h
  · rw [wfR_hist_small h _ Yne _ q]
    apply g.hist_legal_rtake
    apply Rdef_leg g _ (Y 1)
    specialize Yp 0
    rw [R, Y0] at Yp
    exact Yp
  · rw [not_lt] at q
    rw [wfR_hist_big h _ Y0 Yp Yne _ q]
    apply Rdef_leg g _ (Y ((t - List.length h) + 1))
    apply Yp (t - List.length h)


lemma wfR_hist_extend [DecidableEq β] (h : List β)
  (Y : ℕ → List β) (Y0 : Y 0 = h) (Yp : ∀ (n : ℕ), R g (Y (n + 1)) (Y n)) :
  ∀ (n : ℕ), ∃ f, Y n = f ++ h :=
  by
  intro n
  induction' n with n ih
  · use []
    rw [Y0, List.nil_append]
  · obtain ⟨a,adef⟩ := (Yp n).extend
    obtain ⟨f,fdef⟩ := ih
    use (a :: f)
    rw [adef,fdef, List.cons_append]


lemma wfR [DecidableEq β] (g : Game_World α β)
  (hgw : g.isWL) (hgp : g.playable) (hgn : Game_World.coherent_end g) : WellFounded (R g) := by
  apply WellFounded.intro
  intro h
  by_contra con
  obtain ⟨Y, Y0,Yp⟩ := not_Acc _ h con
  rw [g.isWL_iff_isWL_alt hgp] at hgw
  have Yne : ∀ n, Y (n+1) ≠ [] := by
    intro n
    obtain ⟨a,yes⟩ := (Yp n).extend
    rw [yes]
    exact List.cons_ne_nil a (Y n)
  let moves (n : Nat) := if Q : n < h.length then h.rget ⟨n,Q⟩ else (Y ((n - h.length) + 1)).head (Yne (n - h.length))
  obtain ⟨T,Tdef⟩ := hgw moves (wfR_legal g h Y Y0 Yp Yne)
  by_cases qt : T < h.length
  · rw [wfR_hist_small h _ Yne _ qt] at Tdef
    rw [← List.rdrop_append_rtake T h] at Y0
    cases' Tdef with N N
    · apply (Rdef_neutral g hgn (Y 0) (Y (01)) (Yp (0))).1
      rw [Y0]
      apply g.coherent_end_all_fst hgn _ N
      rw [← Y0]
      apply Rdef_leg g _ (Y 1) (Yp 0)
    · apply (Rdef_neutral g hgn (Y 0) (Y (01)) (Yp (0))).2
      rw [Y0]
      apply g.coherent_end_all_snd hgn _ N
      rw [← Y0]
      apply Rdef_leg g _ (Y 1) (Yp 0)
  · rw [not_lt] at qt
    rw [wfR_hist_big h _ Y0 Yp Yne _ qt] at Tdef
    cases' Tdef with N N
    · exact (Rdef_neutral g hgn (Y (T - List.length h)) (Y (T - List.length h + 1)) (Yp (T - List.length h))).1 N
    · exact (Rdef_neutral g hgn (Y (T - List.length h)) (Y (T - List.length h + 1)) (Yp (T - List.length h))).2 N


lemma Game_World.staged_WL_of_win_state_fst [DecidableEq β] (g : Game_World α β)
  (hgp : g.playable) (hgn : Game_World.coherent_end g)
  (h : List β) (leg : g.hist_legal h)
  (N : g.fst_win_states h) :
  g.is_fst_staged_win h leg :=
  by
  use (g.exStrat_staged_fst hgp h leg)
  intro s_strat
  apply @Game.coherent_end_fst_win _ _ _ (by apply hgn)
  use h.length
  convert N
  dsimp [Game.hist_on_turn]
  apply g.History_of_staged_length


lemma Game_World.staged_WL_of_win_state_snd [DecidableEq β] (g : Game_World α β)
  (hgp : g.playable) (hgn : Game_World.coherent_end g)
  (h : List β) (leg : g.hist_legal h)
  (N : g.snd_win_states h) :
  g.is_snd_staged_win h leg :=
  by
  use (exStrat_staged_snd g hgp h leg)
  intro s_strat
  apply @Game.coherent_end_snd_win _ _ _ (by apply hgn)
  use h.length
  convert N
  dsimp [Game.hist_on_turn]
  apply g.History_of_staged_length


lemma Game_World.staged_WL_of_win_state [DecidableEq β] (g : Game_World α β)
  (hgp : g.playable) (hgn : Game_World.coherent_end g)
  (h : List β) (leg : g.hist_legal h)
  (N : g.fst_win_states h ∨ g.snd_win_states h) :
  g.has_staged_WL h leg :=
  by
  cases' N with N N
  · apply Game_World.has_staged_WL.wf
    apply g.staged_WL_of_win_state_fst hgp hgn _ _ N
  · apply Game_World.has_staged_WL.ws
    apply g.staged_WL_of_win_state_snd hgp hgn _ _ N



lemma Game_World.ConwayInduction [DecidableEq β] (g : Game_World α β)
  (hgw : g.isWL) (hgp : g.playable) (hgn : g.coherent_end)
  (motive : (h : List β) → (g.hist_legal h) → Sort _)
  (hist : List β) (leg : g.hist_legal hist)
  (step : ∀ (h : List β), (leg' : g.hist_legal h) → (∀ (y : List β) (rel : R g y h), motive y rel.leg) → motive h leg') :
  motive hist leg :=
  by
  revert leg
  apply @WellFounded.recursion _ _ (wfR g hgw hgp hgn) (fun x => ∀ (leg : g.hist_legal x), motive x leg) hist
  intro h ih leg
  replace ih : ∀ (y : List β), (rel : R g y h) → motive y (rel.leg) := by
    intro y rel ; apply ih _ rel
  exact step h leg ih
