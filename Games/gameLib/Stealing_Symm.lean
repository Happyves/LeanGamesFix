/-
Copyright (c) 2024 Yves Jäckle. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Yves Jäckle.
-/


import Mathlib.Tactic
import Games.gameLib.Zermelo_Symm
import Games.exLib.List


def strat_predeco (strat : Strategy α β) (prehist : List β) (g : Symm_Game_World α β) : Strategy α β :=
  (fun _ hist => if s : hist.length < prehist.length then prehist.reverse.get ⟨hist.length, (by rw [List.length_reverse] ; exact s)⟩  else strat (g.world_after_preHist prehist).init_game_state (hist.rdrop prehist.length))

lemma strat_predeco_at_append_prehist (strat : Strategy α β) (prehist : List β) (g : Symm_Game_World α β) :
  ∀ hist : List β, (strat_predeco strat prehist g) g.init_game_state (hist ++ prehist) = strat (g.world_after_preHist prehist).init_game_state hist :=
  by
  intro hist
  dsimp [strat_predeco]
  rw [dif_neg (by simp only [List.length_append, add_lt_iff_neg_right, not_lt_zero', not_false_eq_true])]
  have hmm := @List.rdrop_append _ hist prehist 0
  dsimp at hmm
  simp_rw [hmm]
  rw [List.rdrop_zero]



lemma Symm_Game_World.History_of_predeco_len_prehist
  (g: Symm_Game_World α β)
  (prehist: List β)
  (f_strat s_strat : Strategy α β)
  :
  let fst_strat := strat_predeco f_strat prehist g
  let snd_strat := strat_predeco s_strat prehist g
  History_on_turn g.init_game_state fst_strat snd_strat (prehist.length) = prehist :=
  by
  induction' prehist with x l ih
  · dsimp [History_on_turn]
  · dsimp at *
    dsimp [History_on_turn]
    by_cases q : Turn_fst (List.length l + 1)
    · rw [if_pos q]
      dsimp [strat_predeco]
      simp_rw [History_on_turn_length]
      rw [dif_pos (by exact Nat.lt.base (List.length l))]
      have := List.get_reverse (x :: l) 0
          (by dsimp ; rw [Nat.succ_sub_one, List.length_reverse] ; dsimp ; apply Nat.lt.base )
          (by dsimp ; exact Nat.succ_pos (List.length l))
      dsimp at this
      simp_rw [Nat.succ_sub_one] at this
      rw [this]
      congr
      convert ih using 1
      have that (f_strat : Strategy α β): ∀ (hist : List β), List.length hist < List.length l →
            strat_predeco f_strat (x :: l) g g.init_game_state hist = strat_predeco f_strat l g g.init_game_state hist :=
            by
            intro h hl
            dsimp [strat_predeco]
            simp_rw [Nat.lt_succ, dif_pos hl, dif_pos (le_of_lt hl)]
            have tec1 := List.get_reverse (x :: l) (l.length - h.length)
              (by dsimp ; rw [Nat.succ_sub_one, List.length_reverse] ; dsimp ; rw [Nat.sub_sub_self (le_of_lt hl)] ; exact Nat.lt.step hl)
              (by dsimp ; rw [Nat.lt_succ] ; exact Nat.sub_le (List.length l) (List.length h) )
            dsimp at tec1
            simp_rw [Nat.succ_sub_one, Nat.sub_sub_self (le_of_lt hl)] at tec1
            rw [tec1]
            clear tec1
            have tec2 := List.get_reverse' (l) ⟨h.length, (by rwa [List.length_reverse])⟩
              (by dsimp ; exact Nat.sub_one_sub_lt hl )
            dsimp at tec2
            rw [tec2]
            clear tec2
            cases' l with z l
            · contradiction
            · dsimp at *
              simp_rw [Nat.succ_sub_one, Nat.succ_eq_add_one]
              dsimp at hl
              rw [Nat.lt_succ] at hl
              simp_rw [Nat.sub_add_comm hl]
              rw [List.get_cons_succ]
      apply History_eq_of_strat_strong_eq' _ _ _ _ _ (l.length)
      · exact that f_strat
      · exact that s_strat
      · apply Nat.le.refl
    · rw [if_neg q]
      dsimp [strat_predeco]
      simp_rw [History_on_turn_length]
      rw [dif_pos (by exact Nat.lt.base (List.length l))]
      have := List.get_reverse (x :: l) 0
          (by dsimp ; rw [Nat.succ_sub_one, List.length_reverse] ; dsimp ; apply Nat.lt.base )
          (by dsimp ; exact Nat.succ_pos (List.length l))
      dsimp at this
      simp_rw [Nat.succ_sub_one] at this
      rw [this]
      congr
      convert ih using 1
      have that (f_strat : Strategy α β): ∀ (hist : List β), List.length hist < List.length l →
            strat_predeco f_strat (x :: l) g g.init_game_state hist = strat_predeco f_strat l g g.init_game_state hist :=
            by
            intro h hl
            dsimp [strat_predeco]
            simp_rw [Nat.lt_succ, dif_pos hl, dif_pos (le_of_lt hl)]
            have tec1 := List.get_reverse (x :: l) (l.length - h.length)
              (by dsimp ; rw [Nat.succ_sub_one, List.length_reverse] ; dsimp ; rw [Nat.sub_sub_self (le_of_lt hl)] ; exact Nat.lt.step hl)
              (by dsimp ; rw [Nat.lt_succ] ; exact Nat.sub_le (List.length l) (List.length h) )
            dsimp at tec1
            simp_rw [Nat.succ_sub_one, Nat.sub_sub_self (le_of_lt hl)] at tec1
            rw [tec1]
            clear tec1
            have tec2 := List.get_reverse' (l) ⟨h.length, (by rwa [List.length_reverse])⟩
              (by dsimp ; exact Nat.sub_one_sub_lt hl )
            dsimp at tec2
            rw [tec2]
            clear tec2
            cases' l with z l
            · contradiction
            · dsimp at *
              simp_rw [Nat.succ_sub_one, Nat.succ_eq_add_one]
              dsimp at hl
              rw [Nat.lt_succ] at hl
              simp_rw [Nat.sub_add_comm hl]
              rw [List.get_cons_succ]
      apply History_eq_of_strat_strong_eq' _ _ _ _ _ (l.length)
      · exact that f_strat
      · exact that s_strat
      · apply Nat.le.refl


lemma Symm_Game_World.History_of_predeco_len_cons_prehist
  (g: Symm_Game_World α β)
  (prehist: List β) (act : β)
  (f_strat s_strat : Strategy α β)
  :
  let fst_strat := strat_predeco f_strat (act :: prehist) g
  let snd_strat := strat_predeco s_strat (act :: prehist) g
  History_on_turn g.init_game_state fst_strat snd_strat (prehist.length) = prehist :=
  by
  induction' prehist with x l ih
  · dsimp [History_on_turn]
  · dsimp at *
    dsimp [History_on_turn]
    by_cases q : Turn_fst (List.length l + 1)
    · rw [if_pos q]
      dsimp [strat_predeco]
      simp_rw [History_on_turn_length]
      rw [dif_pos (by linarith)]
      have := List.get_reverse (act :: x :: l) 1
          (by dsimp ; rw [Nat.succ_sub_one, List.length_reverse] ; dsimp ; linarith )
          (by dsimp ; linarith)
      dsimp at this
      simp_rw [Nat.succ_sub_one] at this
      rw [this]
      congr
      convert ih using 1
      have that (f_strat : Strategy α β): ∀ (hist : List β), List.length hist < List.length l →
            strat_predeco f_strat (act :: x :: l) g g.init_game_state hist = strat_predeco f_strat (act :: l) g g.init_game_state hist :=
            by
            intro h hl
            dsimp [strat_predeco]
            simp_rw [Nat.lt_succ, dif_pos (le_of_lt hl)]
            rw [dif_pos (by apply Nat.le.step ; exact le_of_lt hl)]
            have tec1 := List.get_reverse (act :: x :: l) (l.length + 1 - h.length)
              (by dsimp ; rw [Nat.succ_sub_one, List.length_reverse] ; dsimp ; rw [Nat.sub_sub_self] ; linarith ; linarith )
              (by dsimp ; rw [Nat.succ_sub] ; apply Nat.succ_lt_succ ; rw [Nat.lt_succ] ; apply Nat.sub_le ; exact le_of_lt hl)
            dsimp at tec1
            have pain : Nat.succ (Nat.succ (List.length l)) - 1 - (List.length l + 1 - List.length h) = h.length  :=
              by rw [Nat.succ_sub_one, Nat.sub_sub_self] ; linarith
            simp_rw [pain] at tec1
            rw [tec1]
            clear tec1
            have tec2 := List.get_reverse' (act :: l) ⟨h.length, (by rw [List.length_reverse] ; dsimp ; linarith)⟩
              (by dsimp ; rw [Nat.succ_sub_one, Nat.lt_succ] ; apply Nat.sub_le)
            dsimp at tec2
            rw [tec2]
            clear tec2
            cases' l with z l
            · contradiction
            · dsimp at *
              simp_rw [Nat.succ_sub_one, Nat.succ_eq_add_one]
              dsimp at hl
              simp_rw [Nat.sub_add_comm (le_of_lt hl)]
              simp_rw [Nat.succ_eq_add_one]
              rw [Nat.lt_succ] at hl
              simp_rw [Nat.sub_add_comm hl]
              repeat rw [List.get_cons_succ]

      apply History_eq_of_strat_strong_eq' _ _ _ _ _ (l.length)
      · exact that f_strat
      · exact that s_strat
      · apply Nat.le.refl
    · rw [if_neg q]
      dsimp [strat_predeco]
      simp_rw [History_on_turn_length]
      rw [dif_pos (by linarith)]
      have := List.get_reverse (act :: x :: l) 1
          (by dsimp ; rw [Nat.succ_sub_one, List.length_reverse] ; dsimp ; linarith )
          (by dsimp ; linarith)
      dsimp at this
      simp_rw [Nat.succ_sub_one] at this
      rw [this]
      congr
      convert ih using 1
      have that (f_strat : Strategy α β): ∀ (hist : List β), List.length hist < List.length l →
            strat_predeco f_strat (act :: x :: l) g g.init_game_state hist = strat_predeco f_strat (act :: l) g g.init_game_state hist :=
            by
            intro h hl
            dsimp [strat_predeco]
            simp_rw [Nat.lt_succ, dif_pos (le_of_lt hl)]
            rw [dif_pos (by apply Nat.le.step ; exact le_of_lt hl)]
            have tec1 := List.get_reverse (act :: x :: l) (l.length + 1 - h.length)
              (by dsimp ; rw [Nat.succ_sub_one, List.length_reverse] ; dsimp ; rw [Nat.sub_sub_self] ; linarith ; linarith )
              (by dsimp ; rw [Nat.succ_sub] ; apply Nat.succ_lt_succ ; rw [Nat.lt_succ] ; apply Nat.sub_le ; exact le_of_lt hl)
            dsimp at tec1
            have pain : Nat.succ (Nat.succ (List.length l)) - 1 - (List.length l + 1 - List.length h) = h.length  :=
              by rw [Nat.succ_sub_one, Nat.sub_sub_self] ; linarith
            simp_rw [pain] at tec1
            rw [tec1]
            clear tec1
            have tec2 := List.get_reverse' (act :: l) ⟨h.length, (by rw [List.length_reverse] ; dsimp ; linarith)⟩
              (by dsimp ; rw [Nat.succ_sub_one, Nat.lt_succ] ; apply Nat.sub_le)
            dsimp at tec2
            rw [tec2]
            clear tec2
            cases' l with z l
            · contradiction
            · dsimp at *
              simp_rw [Nat.succ_sub_one, Nat.succ_eq_add_one]
              dsimp at hl
              simp_rw [Nat.sub_add_comm (le_of_lt hl)]
              simp_rw [Nat.succ_eq_add_one]
              rw [Nat.lt_succ] at hl
              simp_rw [Nat.sub_add_comm hl]
              repeat rw [List.get_cons_succ]
      apply History_eq_of_strat_strong_eq' _ _ _ _ _ (l.length)
      · exact that f_strat
      · exact that s_strat
      · apply Nat.le.refl



lemma Symm_Game_World.History_of_predeco_even
  (g: Symm_Game_World α β)
  (prehist: List β)
  (hp : Turn_snd prehist.length)
  (f_strat s_strat : Strategy α β)
  (turn : ℕ):
  let fst_strat := strat_predeco f_strat prehist g
  let snd_strat := strat_predeco s_strat prehist g
  History_on_turn g.init_game_state fst_strat snd_strat (turn + prehist.length) =
  (History_on_turn (g.world_after_preHist prehist).init_game_state f_strat s_strat turn) ++ prehist :=
  by
  intro fst_strat snd_strat
  induction' turn with t ih
  · dsimp [History_on_turn]
    rw [Nat.zero_add, g.History_of_predeco_len_prehist]
  · rw [Nat.succ_eq_add_one, add_assoc, (show 1 + prehist.length = prehist.length + 1 from by rw [add_comm]), ← add_assoc]
    dsimp [History_on_turn]
    simp_rw [ih, strat_predeco_at_append_prehist]
    by_cases q : Turn_fst (t + 1)
    · rw [if_pos q]
      replace q := Turn_add_fst_snd _ _ q hp
      rw [if_pos (by convert q using 1 ; ring)]
      rw [List.cons_append]
    · rw [if_neg q]
      rw [← Turn_fst_not_step] at q
      replace q := Turn_add_fst_snd _ _ q hp
      rw [Turn_fst_not_step] at q
      rw [if_neg (by exact q)]
      rw [List.cons_append]


lemma Symm_Game_World.History_of_predeco_odd
  (g: Symm_Game_World α β)
  (prehist: List β)
  (hp : Turn_fst prehist.length)
  (f_strat s_strat : Strategy α β)
  (turn : ℕ):
  let fst_strat := strat_predeco f_strat prehist g
  let snd_strat := strat_predeco s_strat prehist g
  History_on_turn g.init_game_state fst_strat snd_strat (turn + prehist.length) =
  (History_on_turn (g.world_after_preHist prehist).init_game_state s_strat f_strat turn) ++ prehist :=
  by
  intro fst_strat snd_strat
  induction' turn with t ih
  · dsimp [History_on_turn]
    rw [Nat.zero_add, g.History_of_predeco_len_prehist]
  · rw [Nat.succ_eq_add_one, add_assoc, (show 1 + prehist.length = prehist.length + 1 from by rw [add_comm]), ← add_assoc]
    dsimp [History_on_turn]
    simp_rw [ih, strat_predeco_at_append_prehist]
    by_cases q : Turn_fst (t + 1)
    · rw [if_pos q]
      replace q := Turn_add_fst_fst _ _ q hp
      rw [← Turn_not_fst_iff_snd] at q
      rw [if_neg (by convert q using 1 ; ring)]
      rw [List.cons_append]
    · rw [if_neg q]
      rw [← Turn_fst_not_step] at q
      replace q := Turn_add_fst_fst _ _ q hp
      rw [← Turn_not_fst_iff_snd] at q
      rw [Turn_fst_not_step, not_not] at q
      rw [if_pos (by exact q)]
      rw [List.cons_append]

--#exit



lemma Symm_Game_World.State_of_predeco_len_prehist
  (g: Symm_Game_World α β)
  (prehist: List β)
  (f_strat s_strat : Strategy α β)
  :
  let fst_strat := strat_predeco f_strat prehist g
  let snd_strat := strat_predeco s_strat prehist g
  (g.world_after_preHist prehist).init_game_state =
  g.state_on_turn fst_strat snd_strat (prehist.length)  :=
  by
  cases' prehist with x l
  · dsimp!
  · dsimp!
    split_ifs
    · dsimp [history_on_turn]
      rw [Symm_Game_World.History_of_predeco_len_cons_prehist]
      -- amybe make this a lemma
      dsimp [strat_predeco]
      rw [dif_pos (by linarith)]
      congr
      rw [List.get_reverse']
      dsimp
      simp_rw [Nat.succ_sub_one, Nat.sub_self]
      have := @List.get_cons_zero _ x l
      rw [eq_comm]
      convert this
      dsimp
      simp_rw [Nat.succ_sub_one, Nat.sub_self]
      exact Nat.succ_pos (List.length l)
    · dsimp [history_on_turn]
      rw [Symm_Game_World.History_of_predeco_len_cons_prehist]
      -- amybe make this a lemma
      dsimp [strat_predeco]
      rw [dif_pos (by linarith)]
      congr
      rw [List.get_reverse']
      dsimp
      simp_rw [Nat.succ_sub_one, Nat.sub_self]
      have := @List.get_cons_zero _ x l
      rw [eq_comm]
      convert this
      dsimp
      simp_rw [Nat.succ_sub_one, Nat.sub_self]
      exact Nat.succ_pos (List.length l)


--#exit

lemma Symm_Game_World.state_world_after_preHist_even (g : Symm_Game_World α β)
  (transition_careless : careless g.law g.law g.init_game_state g.transition g.transition)
  (prehist : List β) (hpne : prehist ≠ [])  (hpl : Hist_legal g.law g.law g.init_game_state prehist) (hp : Turn_snd prehist.length)
  (fst_strat snd_strat : Strategy α β) (t : ℕ) :
  (g.world_after_preHist prehist).state_on_turn fst_strat snd_strat t =
  (g.state_on_turn (strat_predeco fst_strat prehist g) (strat_predeco snd_strat prehist g) (t + prehist.length)):=
  by
  cases' t with t
  · dsimp!
    rw [zero_add]
    apply g.State_of_predeco_len_prehist
  · rw [Nat.succ_add]
    dsimp [state_on_turn]
    by_cases q : Turn_fst (t+1)
    · rw [if_pos q]
      simp_rw [show t + prehist.length + 1 = t + 1 + prehist.length from by ring]
      rw [if_pos (Turn_add_fst_snd _ _ q hp)]
      dsimp [history_on_turn]
      simp_rw [g.History_of_predeco_even prehist hp fst_strat snd_strat]
      specialize transition_careless g.init_game_state (History_on_turn (world_after_preHist g prehist).init_game_state fst_strat snd_strat t) prehist hpne hpl
      rw [transition_careless]
      rw [strat_predeco_at_append_prehist]
      cases' prehist with x l
      · contradiction
      · dsimp [world_after_preHist]
    · rw [if_neg q]
      rw [Turn_not_fst_iff_snd] at q
      simp_rw [← Turn_not_snd_iff_fst]
      simp_rw [show t + prehist.length + 1 = t + 1 + prehist.length from by ring]
      rw [if_neg (by rw [not_not] ; apply Turn_add_snd_snd _ _ q hp)]
      dsimp [history_on_turn]
      simp_rw [g.History_of_predeco_even prehist hp fst_strat snd_strat]
      specialize transition_careless g.init_game_state (History_on_turn (world_after_preHist g prehist).init_game_state fst_strat snd_strat t) prehist hpne hpl
      rw [transition_careless]
      rw [strat_predeco_at_append_prehist]
      cases' prehist with x l
      · contradiction
      · dsimp [world_after_preHist]



lemma Symm_Game_World.state_world_after_preHist_odd (g : Symm_Game_World α β)
  (transition_careless : careless g.law g.law g.init_game_state g.transition g.transition)
  (prehist : List β) (hpne : prehist ≠ [])  (hpl : Hist_legal g.law g.law g.init_game_state prehist) (hp : Turn_fst prehist.length)
  (fst_strat snd_strat : Strategy α β) (t : ℕ) :
  (g.world_after_preHist prehist).state_on_turn snd_strat fst_strat t =
  (g.state_on_turn (strat_predeco fst_strat prehist g) (strat_predeco snd_strat prehist g) (t + prehist.length)):=
  by
  cases' t with t
  · dsimp!
    rw [zero_add]
    apply g.State_of_predeco_len_prehist
  · rw [Nat.succ_add]
    dsimp [state_on_turn]
    by_cases q : Turn_fst (t+1)
    · rw [if_pos q]
      simp_rw [← Turn_not_snd_iff_fst]
      simp_rw [show t + prehist.length + 1 = t + 1 + prehist.length from by ring]
      rw [if_neg (by rw [not_not] ; apply Turn_add_fst_fst _ _ q hp)]
      dsimp [history_on_turn]
      simp_rw [g.History_of_predeco_odd prehist hp fst_strat snd_strat]
      specialize transition_careless g.init_game_state (History_on_turn (world_after_preHist g prehist).init_game_state snd_strat fst_strat t) prehist hpne hpl
      rw [transition_careless]
      rw [strat_predeco_at_append_prehist]
      cases' prehist with x l
      · contradiction
      · dsimp [world_after_preHist]
    · rw [if_neg q]
      rw [Turn_not_fst_iff_snd] at q
      simp_rw [show t + prehist.length + 1 = t + 1 + prehist.length from by ring]
      rw [if_pos ( Turn_add_snd_fst _ _ q hp)]
      dsimp [history_on_turn]
      simp_rw [g.History_of_predeco_odd prehist hp fst_strat snd_strat]
      specialize transition_careless g.init_game_state (History_on_turn (world_after_preHist g prehist).init_game_state snd_strat fst_strat t) prehist hpne hpl
      rw [transition_careless]
      rw [strat_predeco_at_append_prehist]
      cases' prehist with x l
      · contradiction
      · dsimp [world_after_preHist]



--#exit

def zSymm_Game_World.world_after_preHist {α β : Type u} (g : zSymm_Game_World α β)
  (prehist : List β) (hpne : prehist ≠ [])  (hpl : Hist_legal g.law g.law g.init_game_state prehist)
  : zSymm_Game_World α β :=
  match d : prehist with
  | [] => g
  | last :: L => {(g.toSymm_Game_World.world_after_preHist prehist) with
                      law_careless :=
                          by
                          cases' prehist with ph
                          · dsimp [Symm_Game_World.world_after_preHist]
                            apply g.law_careless
                          · dsimp [Symm_Game_World.world_after_preHist]
                            apply g.law_careless
                      transition_careless :=
                          by
                          cases' prehist with ph
                          · dsimp [Symm_Game_World.world_after_preHist]
                            apply g.transition_careless
                          · dsimp [Symm_Game_World.world_after_preHist]
                            apply g.transition_careless
                      coherent := by
                                  intro f_strat s_strat t
                                  intro fws
                                  dsimp at *
                                  by_cases k : Turn_fst prehist.length
                                  · rw [g.state_world_after_preHist_odd] at *
                                    · simp_rw [← show t + prehist.length + 1 = t + 1 + prehist.length from by ring]
                                      rw [Symm_Game_World.world_after_preHist_win_states] at *
                                      apply g.coherent_end_all g.coherent _ _ _ _ fws
                                    · apply g.transition_careless
                                    · rw [d] ; apply hpne
                                    · rw [d] ; apply hpl
                                    · apply k
                                    · apply g.transition_careless
                                    · rw [d] ; apply hpne
                                    · rw [d] ; apply hpl
                                    · apply k
                                  · rw [g.state_world_after_preHist_even] at *
                                    · simp_rw [← show t + prehist.length + 1 = t + 1 + prehist.length from by ring]
                                      rw [Symm_Game_World.world_after_preHist_win_states] at *
                                      apply g.coherent_end_all g.coherent _ _ _ _ fws
                                    · apply g.transition_careless
                                    · rw [d] ; apply hpne
                                    · rw [d] ; apply hpl
                                    · apply k
                                    · apply g.transition_careless
                                    · rw [d] ; apply hpne
                                    · rw [d] ; apply hpl
                                    · apply k
                      playable :=
                            by
                            cases' prehist with ph
                            · dsimp [Symm_Game_World.world_after_preHist]
                              apply g.playable
                            · dsimp [Symm_Game_World.world_after_preHist]
                              apply g.playable
                                  }


def Stealing_condition_pre (g : zSymm_Game_World α β)
  (f_act s_act : β)
  (f_leg : g.law g.init_game_state [] f_act) (s_leg : g.law g.init_game_state [f_act] s_act) :
  Prop := ∃ f_steal : β, ∃ fs_leg : g.law g.init_game_state [] f_steal, g.world_after_preHist [s_act, f_act] (by apply List.noConfusion)
      (by apply Hist_legal.cons ; rw [if_neg (by dsimp ; decide)] ; exact s_leg ; apply Hist_legal.cons ; rw [if_pos (by dsimp ; decide)] ; exact f_leg ; apply Hist_legal.nil)
      = g.world_after_fst f_steal fs_leg


def Stealing_condition (g : zSymm_Game_World α β) : Prop :=
  ∀ (f_act s_act : β),
  (f_leg : g.law g.init_game_state [] f_act) →
  (s_leg : g.law g.init_game_state [f_act] s_act) →
  Stealing_condition_pre g f_act s_act f_leg s_leg

noncomputable
def stolen_strat [Inhabited β] (g : zSymm_Game_World α β) (hgs : Stealing_condition g)
  (s_strat : Strategy α β)
  (hfa :  g.law g.init_game_state [] default)
  (hsa : g.law g.init_game_state [default] (s_strat g.init_game_state [default])) : Strategy α β :=
  fun ini hist =>
    if hist = []
    then Classical.choose (hgs default (s_strat g.init_game_state [default]) hfa hsa)
    else s_strat ini (hist.dropLast ++ [(s_strat g.init_game_state [default]), default])



lemma Strategy_stealing [Inhabited β] (g : zSymm_Game_World α β)
  {T : ℕ} (hg : g.isWL_wBound T) (hgs : Stealing_condition g)
  (akward : g.law g.init_game_state [] default): g.is_fst_win :=
  by
  cases' (g.Zermelo hg) with F S
  · exact F
  · obtain ⟨ws, ws_prop⟩ := S
    use (stolen_strat g hgs ws akward (by ))
    -- todo: use playbility (and the powerful `law_nonprohibitive`) to get a playable first strat that extends a first move
