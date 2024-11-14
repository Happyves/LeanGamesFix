

import Mathlib.SetTheory.Game.PGame

import Games.gameLib.Basic

open SetTheory


#check 1

#check PGame.rec
#check PGame.moveRecOn


inductive isMoveType : PGame → Type u → Prop where
| ofLeft g : isMoveType g (g.LeftMoves)
| ofRight g : isMoveType g (g.RightMoves)
| ofPostLeft g T (m : g.LeftMoves) (proof : isMoveType (g.moveLeft m) T) : isMoveType g T
| ofPostRight g T (m : g.RightMoves) (proof : isMoveType (g.moveRight m) T) : isMoveType g T


structure MoveType (g : PGame) where
  type : Type u
  isMT : isMoveType g type
  move : type


inductive preListMoveTypeLegal (g : PGame) : PGame → List (MoveType g) → Prop where
| nil : preListMoveTypeLegal g g []
| consLeft G (tail : List (MoveType g)) (tf : Turn_fst tail.length) -- assumes Left goes first
      (tail_leg : preListMoveTypeLegal g G tail) (m : G.LeftMoves)
      (h : isMoveType g G.LeftMoves) :
        preListMoveTypeLegal g (G.moveLeft m) (⟨G.LeftMoves, h, m⟩ :: tail)
| consRight G (tail : List (MoveType g)) (tf : Turn_snd tail.length)
      (tail_leg : preListMoveTypeLegal g G tail) (m : G.RightMoves)
      (h : isMoveType g G.RightMoves) :
        preListMoveTypeLegal g (G.moveRight m) (⟨G.RightMoves, h, m⟩ :: tail)

def ListMoveTypeLegal (g : PGame) (ms : List (MoveType g)) : Prop :=
  ∃ G : PGame, preListMoveTypeLegal g G ms
