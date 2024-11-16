/-
Copyright (c) 2024 Yves Jäckle. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Yves Jäckle.
-/

import Games.gameLibExpExp.Basic


inductive  Game_World.c_hist_on_turn_valid (g :  Game_World α β) {t : Nat} : g.c_hist_on_turn_output t → Prop
| ofTerminal (result : {hist : List β // g.hist_legal hist ∧ hist.length = t}) : g.c_hist_on_turn_valid (.terminal result)
| ofNonterminal (result : {hist : List β // g.hist_legal hist ∧ hist.length = t}) (property : g.hist_neutral result.val) : g.c_hist_on_turn_valid (.nonterminal result property)



lemma  Game_World.c_hist_on_turn_valid_not_invalid (g :  Game_World α β)
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )]
  (fst_strat : g.cfStrategy ) (snd_strat : g.csStrategy)
  (t : ℕ) (V : g.c_hist_on_turn_valid (g.c_hist_on_turn fst_strat snd_strat t)) :
  g.c_hist_on_turn fst_strat snd_strat t ≠  Game_World.c_hist_on_turn_output.invalid :=
  match Q : g.c_hist_on_turn fst_strat snd_strat t with
  | .invalid => by rw [Q] at V ; cases V
  | .terminal _ =>  Game_World.c_hist_on_turn_output.noConfusion
  | .nonterminal _ _ =>  Game_World.c_hist_on_turn_output.noConfusion


lemma cGame.c_hist_on_turn_valid_not_invalid (g : cGame α β)
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )]
  (t : ℕ) (V : g.c_hist_on_turn_valid (g.c_hist_on_turn t)) :
  g.c_hist_on_turn t ≠  Game_World.c_hist_on_turn_output.invalid :=
   Game_World.c_hist_on_turn_valid_not_invalid _ _ _ _ V



def  Game_World.c_hist_on_turn_value (g :  Game_World α β)
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )]
  (fst_strat : g.cfStrategy ) (snd_strat : g.csStrategy)
  (t : ℕ) (V : g.c_hist_on_turn_valid (g.c_hist_on_turn fst_strat snd_strat t)) :
  List β :=
  match Q : g.c_hist_on_turn fst_strat snd_strat t with
  | .invalid => False.elim ((g.c_hist_on_turn_valid_not_invalid _ _ _ V) Q)
  | .terminal res => res.val
  | .nonterminal res _ => res.val

def cGame.c_hist_on_turn_value (g : cGame α β)
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )]
  (t : ℕ) (V : g.c_hist_on_turn_valid (g.c_hist_on_turn t)) :=
  g.toGame_World.c_hist_on_turn_value g.fst_strat g.snd_strat t V





lemma  Game_World.c_hist_on_turn_value_length (g :  Game_World α β)
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )]
  (fst_strat : g.cfStrategy ) (snd_strat : g.csStrategy)
  (t : ℕ) (V : g.c_hist_on_turn_valid (g.c_hist_on_turn fst_strat snd_strat t)) :
  (g.c_hist_on_turn_value fst_strat snd_strat t V).length = t :=
  match Q : g.c_hist_on_turn fst_strat snd_strat t with
  | .invalid => False.elim ((g.c_hist_on_turn_valid_not_invalid _ _ _ V) Q)
  | .terminal _ | .nonterminal _ _ => by
      dsimp [Game_World.c_hist_on_turn_value]
      split
      · contradiction
      · rename_i res' _
        apply res'.prop.2
      · rename_i res' _ _
        apply res'.prop.2


lemma cGame.c_hist_on_turn_value_length (g : cGame α β)
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )]
  (t : ℕ) (V : g.c_hist_on_turn_valid (g.c_hist_on_turn t)) :
  (g.c_hist_on_turn_value t V).length = t :=
  g.toGame_World.c_hist_on_turn_value_length g.fst_strat g.snd_strat t V



lemma  Game_World.c_hist_on_turn_value_legal (g :  Game_World α β)
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )]
  (fst_strat : g.cfStrategy ) (snd_strat : g.csStrategy)
  (t : ℕ) (V : g.c_hist_on_turn_valid (g.c_hist_on_turn fst_strat snd_strat t)) :
  g.hist_legal (g.c_hist_on_turn_value fst_strat snd_strat t V) :=
  match Q : g.c_hist_on_turn fst_strat snd_strat t with
  | .invalid => False.elim ((g.c_hist_on_turn_valid_not_invalid _ _ _ V) Q)
  | .terminal _ | .nonterminal _ _ => by
      dsimp [Game_World.c_hist_on_turn_value]
      split
      · contradiction
      · rename_i res' _
        apply res'.prop.1
      · rename_i res' _ _
        apply res'.prop.1


lemma cGame.c_hist_on_turn_value_legal (g : cGame α β)
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )]
  (t : ℕ) (V : g.c_hist_on_turn_valid (g.c_hist_on_turn t)) :
  g.hist_legal (g.c_hist_on_turn_value t V) :=
  g.toGame_World.c_hist_on_turn_value_legal g.fst_strat g.snd_strat t V



lemma  Game_World.c_hist_on_turn_value_zero (g :  Game_World α β)
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )]
  {fst_strat : g.cfStrategy} {snd_strat : g.csStrategy}
  {V : g.c_hist_on_turn_valid (g.c_hist_on_turn fst_strat snd_strat 0)} :
  (g.c_hist_on_turn_value fst_strat snd_strat 0 V) = [] :=
  by
  dsimp [c_hist_on_turn_value, c_hist_on_turn]
  split
  · rename_i no
    split_ifs at no
  · rename_i no
    split_ifs at no
    replace no := c_hist_on_turn_output.terminal.inj no
    apply Subtype.val_inj.mpr no.symm
  · rename_i no
    split_ifs at no
    replace no := c_hist_on_turn_output.nonterminal.inj no
    apply Subtype.val_inj.mpr no.symm

--set_option pp.all true in
lemma Game_World.c_hist_on_turn_valid_succ (g :  Game_World α β)
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )]
  {fst_strat : g.cfStrategy} {snd_strat : g.csStrategy} {t : Nat}
  (V : g.c_hist_on_turn_valid (g.c_hist_on_turn fst_strat snd_strat (t+1))) :
  g.c_hist_on_turn_valid (g.c_hist_on_turn fst_strat snd_strat t) :=
  by
  dsimp [c_hist_on_turn] at V
  split at V
  · rename_i out eq
    exfalso
    apply g.c_hist_on_turn_valid_not_invalid fst_strat snd_strat t _ eq
    rw [eq]

  · rename_i out res eq
