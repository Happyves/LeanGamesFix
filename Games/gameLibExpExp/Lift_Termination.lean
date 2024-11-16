/-
Copyright (c) 2024 Yves Jäckle. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Yves Jäckle.
-/

import Games.gameLibExpExp.Termination
import Games.gameLibExpExp.Lift


#check 1

lemma Game_World.lifting_Turn_isWL (g : Game_World α β) [Inhabited α] [Inhabited β]
  [DecidablePred (g.fst_win_states)] [DecidablePred (g.snd_win_states )]
  [∀ hist, DecidablePred (g.fst_legal hist)] [∀ hist, DecidablePred (g.snd_legal hist)]
  [DecidablePred (g.lift.fst_win_states)] [DecidablePred (g.lift.snd_win_states)]
  (ce : g.coherent_end)  (f : g.cfStrategy) (s : g.csStrategy) {t : Nat}
  (main : g.lift.Turn_isWL (g.liftF ce f) (g.liftS ce s) t) :
  g.c_Turn_c_isWL f s t :=
  by
  cases' main with F S
  · sorry
  · sorry
