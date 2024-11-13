/-
Copyright (c) 2024 Yves Jäckle. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Yves Jäckle.
-/

import Games.gameLib.Basic



-- # Strategies

def Game_World.cfStrategy (g : Game_World α β) :=
  (hist : List β) → (Turn_fst (hist.length+1)) →
  (g.hist_legal hist) → (g.hist_neutral hist) →
  { act : β // g.fst_legal hist act}

def Game_World.csStrategy (g : Game_World α β) :=
  (hist : List β) → (Turn_snd (hist.length+1)) →
  (g.hist_legal hist) → (g.hist_neutral hist) →
  { act : β // g.snd_legal hist act}

def Game_World_wDraw.cfStrategy (g : Game_World_wDraw α β) :=
  g.toGame_World.fStrategy

def Game_World_wDraw.csStrategy (g : Game_World_wDraw α β) :=
  g.toGame_World.sStrategy

def Symm_Game_World.cfStrategy (g : Symm_Game_World α β) :=
  g.toGame_World.fStrategy

def Symm_Game_World.csStrategy (g : Symm_Game_World α β) :=
  g.toGame_World.sStrategy




-- # Histories


inductive Game_World.c_hist_on_turn_output (g : Game_World α β) (t : Nat) where
| invalid
| terminal (result : {hist : List β // g.hist_legal hist ∧ hist.length = t})
| nonterminal (result : {hist : List β // g.hist_legal hist ∧ hist.length = t}) (property : g.hist_neutral result.val)


def Game_World.c_hist_on_turn (g : Game_World α β)
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )]
  (fst_strat : g.cfStrategy ) (snd_strat : g.csStrategy)
  (t : ℕ) : g.c_hist_on_turn_output t :=
  match t with
  | 0 =>
      if N : g.hist_neutral []
      then
        .nonterminal ⟨[], ⟨Game_World.hist_legal.nil, rfl⟩⟩ N
      else
        .terminal ⟨[], ⟨Game_World.hist_legal.nil, rfl⟩⟩
  | n+1 =>  let h? := g.c_hist_on_turn fst_strat snd_strat n
            match h? with
            | .invalid | .terminal _ => .invalid
            | .nonterminal h N =>
            if T : Turn_fst (n+1)
            then
                let T' : Turn_fst (List.length h.val + 1) := by rw [h.property.2] ; exact T ;
                let act := (fst_strat h.val T' h.property.1 N).val ;
                let leg := (fst_strat h.val T' h.property.1 N).property ;
                let H := act :: h.val
                if N : g.hist_neutral H
                then .nonterminal ⟨H , ⟨Game_World.hist_legal.cons h.val act (by rw [if_pos T'] ; exact leg) h.property.1, (by dsimp ; rw [h.property.2])⟩⟩ N
                else .terminal ⟨H , ⟨Game_World.hist_legal.cons h.val act (by rw [if_pos T'] ; exact leg) h.property.1, (by dsimp ; rw [h.property.2])⟩⟩
            else
                let T' : Turn_snd (List.length h.val + 1) := by rw [Turn_snd_iff_not_fst , h.property.2] ; exact T ;
                let act := (snd_strat h.val T' h.property.1 N).val ;
                let leg := (snd_strat h.val T' h.property.1 N).property ;
                let H := act :: h.val
                if N : g.hist_neutral H
                then .nonterminal ⟨H , ⟨Game_World.hist_legal.cons h.val act (by rw [if_neg ] ; exact leg ; rw [Turn_not_fst_iff_snd] ; exact T') h.property.1, (by dsimp ; rw [h.property.2])⟩⟩ N
                else .terminal ⟨H , ⟨Game_World.hist_legal.cons h.val act (by rw [if_neg ] ; exact leg ; rw [Turn_not_fst_iff_snd] ; exact T') h.property.1, (by dsimp ; rw [h.property.2])⟩⟩


-- # Games

structure cGame (α β : Type u) extends Game_World α β where
  fst_strat : toGame_World.cfStrategy
  snd_strat : toGame_World.csStrategy



def cGame.c_hist_on_turn (g : cGame α β)
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )]
  (t : ℕ) : g.c_hist_on_turn_output t :=
  g.toGame_World.c_hist_on_turn g.fst_strat g.snd_strat t



-- # State



inductive Game_World.state_on_turn_output where
| invalid
| valid (state : α)


def Game_World.c_state_on_turn (g : Game_World α β)
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )]
  (fst_strat : g.cfStrategy) (snd_strat : g.csStrategy) : ℕ → Game_World.state_on_turn_output
  | 0 => .valid g.init_game_state
  | n+1 =>  let h := g.c_hist_on_turn fst_strat snd_strat n
            match h with
            | .invalid => .invalid
            | .terminal _ => .invalid
            | .nonterminal res N =>
                  if T : Turn_fst (n+1)
                  then let T' : Turn_fst (List.length res.val + 1) := by rw [res.property.2] ; exact T ;
                       .valid (g.fst_transition res (fst_strat res.val T' res.property.1 N))
                  else let T' : Turn_snd (List.length res.val + 1) := by rw [Turn_snd_iff_not_fst , res.property.2] ; exact T ;
                       .valid (g.snd_transition res (snd_strat res.val T' res.property.1 N))
