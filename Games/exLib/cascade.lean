
import Mathlib

#check 1

open BigOperators

#check 2




theorem cascade (k : Nat) (hk : 1 ≤ k) :
  ∀ m : Nat, 1 ≤ m →
  ∃ s : Nat, (1 ≤ s) ∧ (s ≤ k) ∧
    ∃ a :  Nat → Nat, StrictMonoOn a (Finset.Icc s k) ∧ s ≤ a s ∧
      m = ∑ i in (Finset.Icc s k), (Nat.choose (a i) i) :=
  by
  induction' k with k ih
  · contradiction
  · by_cases q1 : 1 ≤ k
    · specialize ih q1
      intro m hm
      sorry -- ref_1
    · simp only [not_le, Nat.lt_one_iff] at q1
      rw [q1]
      intro m hm
      use 1
      refine' ⟨le_refl 1, le_refl 1, _ ⟩
      use (fun n => if n = 1 then m else 0)
      constructor
      · sorry -- ref_2
      · constructor
        · sorry -- ref_3
        · sorry -- ref_4


structure Nat.cascadeData (k : Nat) where
  start : Nat
  one_le_start : 1 ≤ start
  start_le_k : start ≤ k
  seq : Nat → Nat
  seq_mono : StrictMonoOn seq (Finset.Icc start k)
  seq_start : start ≤ seq start

def Nat.cascadeRep (k : Nat) (cas : k.cascadeData) :=
  ∑ i in (Finset.Icc cas.start k), (Nat.choose (cas.seq i) i)

structure Nat.cascade (k m : Nat) :=
  one_le_k : 1 ≤ k
  one_le_m : 1 ≤ m
  data : k.cascadeData
  rep : m = k.cascadeRep data



#exit

-- # ref_3

#check if_pos

-- # ref_2 ref_4

#check Finset.Icc_self
#check Set.strictMonoOn_singleton
#check Finset.sum_singleton
#check if_pos
#check Nat.choose_one_right


-- # ref_1


def a_k_candidates (k m : Nat) : Finset Nat :=
  (Finset.range (m+1)).filter (fun x => Nat.choose x k ≤ m)


def a_k (k m : Nat) (hm : 1 ≤ m) : Nat :=
  Finset.max' (a_k_candidates k m) (by sorry) -- ref 5

lemma a_k_prop (k m : Nat) (hm : 1 ≤ m) : Nat.choose (a_k k m hm) k ≤ m :=
  by
  sorry

#check Finset.mem_filter
#check Finset.max'_mem

lemma a_k_maximiser (k m : Nat) (hm : 1 ≤ m) : ∀ x, Nat.choose x k ≤ m → x ≤ a_k k m hm :=
  by
  intro x x_prop
  by_cases q1 : x ∈ a_k_candidates k m
  · sorry -- ref_6
  · sorry -- ref_7


--Im Hauptbeweis können 2 Fälle passieren, laut
#check le_iff_eq_or_lt

-- Im Fall von = können wir s := (k+1) und a := (fun x => if x = k then (a_k (k+1) m sorry) else 0)
-- setzen und schnell fertig sein

-- Adernfalls können wir ↓ nutzen
#check Nat.sub_pos_iff_lt
#check Nat.lt_iff_add_one_le
-- und erhalten dass `1 ≤ m - (Nat.choose (a_k (k+1) m sorry) (k+1))`

-- Bennen wir `1 ≤ m - (Nat.choose (a_k (k+1) m sorry) (k+1))` *dif*
-- und merken dass man `ih` in *dif* spezialisieren kann
-- Dann gibt `ih` uns ein `s` und eine sequenz `a` (die aber nur auf [s,k] monoton ist, nicht [s,(k+1)])
-- und die Tatsache dass `m - (Nat.choose (a_k (k+1) m sorry) (k+1)) = ∑ i ∈ [s,k], Nat.choose ...`

-- Wir wollen dieses `s` nutzen, und die sequenz erweitern durch:
-- A := `fun x => if x ≤ k then a x else (a_k (k+1) m sorry)`
-- Dann, mit der vorherigen gleichung und:
-- `(Nat.choose (a_k (k+1) m sorry) (k+1)) + (∑ i ∈ [s,k], Nat.choose (a i) i) = ∑ i ∈ [s,(k+1)], Nat.choose (A i) i`
-- (welches wir beweisen müssen), hätten wir unsere gewünschte cascade darstellung für k+1

-- Außerdem muss dann bewiesen werden dass `A k < A (k+1)` für die stricte monotonie
-- Das lemma das im Buch genutz wird ist
#check Nat.choose_succ_succ
-- und sein "contradcitig maximality of aₖ" ist unser lemma "a_k_maximiser" und
#check Nat.not_succ_le_self



-- # ref_5

-- use 0, dann
#check Finset.mem_filter
#check Finset.mem_range
#check Nat.zero_le
-- cases' auf k, dann
#check Nat.choose_zero_right
#check Nat.choose_zero_succ



-- # ref_6

#check Finset.le_max'

-- # ref_7

-- kann `x` in `Finset.range (m+1)` sein ?
#check Finset.mem_filter

-- anschließend als ungleichung azsdrücken, mit
#check Finset.mem_range

-- dann
lemma help_7 (k m x : Nat) (hx : m+1 ≤ x) : m < Nat.choose x k :=
  by
  sorry
-- mit
#check Nat.lt_iff_add_one_le
#check Nat.choose_succ_self_right
#check Nat.choose_le_choose

-- abschließen mit
#check Nat.not_le_of_lt
#check False.elim
-- oder bei letzterem di tactic `exfalso`


-- tmp

#check Finset.max'_le
