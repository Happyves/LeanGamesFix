/-
Copyright (c) 2024 Yves Jäckle. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Yves Jäckle.
-/

import Games.gameLibExpExp.HistoryAPI




def Game_World.c_Turn_c_isWL (g : Game_World α β)
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )]
  (f_strat : g.cfStrategy) (s_strat : g.csStrategy) (turn : ℕ) : Prop :=
  ∃ result : {hist : List β // g.hist_legal hist ∧ hist.length = turn},
    g.c_hist_on_turn f_strat s_strat turn = .terminal result


lemma Game_World.hist_valid_of_c_Turn_c_isWL (g : Game_World α β)
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )]
  {f_strat : g.cfStrategy} {s_strat : g.csStrategy} {turn : ℕ}
  (h : g.c_Turn_c_isWL f_strat s_strat turn) :
  g.c_hist_on_turn_valid (g.c_hist_on_turn f_strat s_strat turn) :=
  by
  obtain ⟨res, res_eq⟩ := h
  rw [res_eq]
  apply Game_World.c_hist_on_turn_valid.ofTerminal res



def Game_World.c_isWL (g : Game_World α β)
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )]: Prop :=
  ∀ (f_strat : g.cfStrategy), ∀ (s_strat : g.csStrategy),
  ∃ turn, g.c_Turn_c_isWL f_strat s_strat turn


def Game_World.c_state_on_turn_neutral (g : Game_World α β)
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )]
  (f_strat : g.cfStrategy) (s_strat : g.csStrategy) (turn : ℕ)  : Prop :=
  ¬ g.c_Turn_c_isWL f_strat s_strat turn

def cGame.c_state_on_turn_neutral (g : cGame α β)
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )]
  (turn : ℕ) : Prop :=
  g.toGame_World.c_state_on_turn_neutral g.fst_strat g.snd_strat turn


def cGame.c_fst_win (g : cGame α β)
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )] : Prop :=
  ∃ turn : ℕ, ∃ V : g.c_Turn_c_isWL g.fst_strat g.snd_strat turn,
    let H := g.c_hist_on_turn_value turn (g.hist_valid_of_c_Turn_c_isWL V)
    g.fst_win_states H ∧ (∀ t < turn, g.c_state_on_turn_neutral t)

def cGame.c_snd_win (g : cGame α β)
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )] : Prop :=
  ∃ turn : ℕ, ∃ V : g.c_Turn_c_isWL g.fst_strat g.snd_strat turn,
    let H := g.c_hist_on_turn_value turn (g.hist_valid_of_c_Turn_c_isWL V)
    g.snd_win_states H ∧ (∀ t < turn, g.c_state_on_turn_neutral t)


def Game_World.c_is_fst_win (g : Game_World α β)
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )] : Prop :=
  ∃ ws : g.cfStrategy, ∀ snd_s : g.csStrategy,
  ({g with fst_strat := ws, snd_strat := snd_s} : cGame α β).c_fst_win

def Game_World.c_is_snd_win (g : Game_World α β)
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )] : Prop :=
  ∃ ws : g.csStrategy, ∀ snd_s : g.cfStrategy,
  ({g with snd_strat := ws, fst_strat := snd_s} : cGame α β).c_fst_win

inductive Game_World.c_has_WL (g : Game_World α β)
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )] : Prop where
  | wf (h : g.c_is_fst_win)
  | ws (h : g.c_is_snd_win)
