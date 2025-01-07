
import Mathlib.Tactic

lemma Nat.succ_inj {n m : Nat} : n.succ = m.succ ↔ n = m := by exact succ_inj'

lemma Nat.le_succ_iff {n m : Nat} : n ≤ m.succ ↔ (n ≤ m ∨ n = m.succ) :=
  by exact le_add_one_iff

lemma Finset.card_le_card (h : A ⊆ B) : Finset.card A ≤ Finset.card B :=
  by exact card_le_of_subset h


lemma Finset.filter_univ_mem  [Fintype α] [DecidableEq α] (s : Finset α):
  Finset.filter (fun x => x ∈ s) Finset.univ = s :=
  by simp [filter_mem_eq_inter]
