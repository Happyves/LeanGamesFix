
/-
Copyright (c) 2024 Yves Jäckle. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Yves Jäckle.
-/

import Games.gameLib.HistoryAPI
import Games.gameLibExpExp.HistoryAPI
import Games.gameLibExpExp.Lift

#check 1


lemma Game_World.lift_histories [Inhabited α] [Inhabited β]
  (g :  Game_World α β) (ce : g.coherent_end)
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )]
  [∀ hist, DecidablePred (g.fst_legal hist)] [∀ hist, DecidablePred (g.snd_legal hist)]
  [DecidablePred (g.lift.fst_win_states)] [DecidablePred (g.lift.snd_win_states)]
  (f : g.cfStrategy ) (s : g.csStrategy)
  (t : ℕ) (V : g.c_hist_on_turn_valid (g.c_hist_on_turn f s t)) :
  (g.c_hist_on_turn_value f s t V) = g.lift.hist_on_turn (g.liftF ce f) (g.liftS ce s) t :=
  by
  induction' t with t ih
  · dsimp [hist_on_turn]
    rw [Game_World.c_hist_on_turn_value_zero]
  ·
