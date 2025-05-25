
import Games.games.PickUpBricks


#check IO.getStdin
#check IO.getStdout
#check IO.FS.Handle.getLine
#check IO.FS.Handle.putStrLn
#check String.toNat?
#eval String.toNat? "2"


def WelcomeAndRules : String :=
"Welcome to the game of Pick Up Bricks (PUB).
The game starts with 9 bricks placed on a stack.
You'll start, writing either \"1\" or \"2\" into stdin, corresponding to the number of bricks you'd like to take from the stack.
The last player to take a brick from the stack wins the game.
We'll have you play against PUB's winning strategy.
Enjoy loosing !
"


partial def mainLoop (stdin stdout : IO.FS.Stream)
  (init_bricks : ℕ) (hist : List ℕ) (ts : Turn_snd (List.length hist))
  (hl : Game_World.hist_legal (Symm_Game_World.toGame_World (PickUpBricks init_bricks)) hist) :
  IO UInt32 :=
  do
  stdout.putStrLn s!"[Info] Please enter the number of bricks you'd like to take from the stack :"
  let inp ← stdin.getLine
  match inp.toNat? with
  | .none =>
    stdout.putStrLn s!"[Info] Please enter a number"
    mainLoop stdin stdout init_bricks hist ts hl
  | .some num =>
      if H : num = 1 ∨ num = 2
      then
        let ihist := num :: hist
        let its : Turn_snd (List.length ihist + 1) := by
          dsimp [ihist] ; rw [← Turn_snd_step] ; exact ts
        let il : Game_World.hist_legal (Symm_Game_World.toGame_World (PickUpBricks init_bricks)) ihist := by
          apply Game_World.hist_legal.cons
          · rw [if_pos (by rw [← Turn_snd_fst_step] ; exact ts)]
            dsimp [PickUpBricks]
            exact H
          · exact hl
        let response := pub_win_strat init_bricks ihist its il
        let nhist := response.1 :: ihist
        let nts : Turn_snd (List.length nhist) := by
          dsimp [nhist] ; rw [← Turn_snd_step] ; exact ts
        let leg : Game_World.hist_legal (Symm_Game_World.toGame_World (PickUpBricks init_bricks)) nhist := by
          dsimp only [nhist]
          apply Game_World.hist_legal.cons
          · rw [if_neg (by rw [Turn_not_fst_iff_snd] ; exact its)]
            apply response.2
          · exact il
        stdout.putStrLn s!"[Info] The opponent took {response.1} brick(s)"
        let now := bricks_from_ini_hist init_bricks nhist
        if now == 0
        then
          stdout.putStrLn s!"[Info] The game has ended. You lost :)"
          return 0
        else
          stdout.putStrLn s!"[Info] The current number of bricks on the stack is {now}"
          mainLoop stdin stdout init_bricks nhist nts leg
      else
        stdout.putStrLn s!"[Info] You may only take 1 or 2 bricks"
        mainLoop stdin stdout init_bricks hist ts hl




def main : IO UInt32 := do
  let stdin ← IO.getStdin
  let stdout ← IO.getStdout
  stdout.putStrLn WelcomeAndRules
  let initBricks := 9
  let hist : List Nat := []
  let ts : Turn_snd (List.length hist) := by decide
  let hl : Game_World.hist_legal (Symm_Game_World.toGame_World (PickUpBricks initBricks)) hist :=
    by apply Game_World.hist_legal.nil
  let now := bricks_from_ini_hist initBricks hist
  if now == 0
  then
    stdout.putStrLn s!"[Info] The game has ended. You lost :)"
    return 0
  else
    stdout.putStrLn s!"[Info] The current number of bricks on the stack is {now}"
    mainLoop stdin stdout initBricks hist ts hl
