{-
    Module: Reed.

    *** PART III (10 pt) ***

    Define a player that uses teh Reed opening and play against it. Is the Reed opening a good 
    opening? Write your answers in Reed.txt.
-}
module Players.Reed where

import Types
import Action
import Game
import Constants
import Players.Minimax

-- Create a player that starts with the Reed opening. After that, you may use your minimax action or
-- the given action for DumbPlayer. 
-- [Hint 1: Use the variable 'turn' in Player.]
-- [Hint 2: Use 'wallTop' to get the walls you need.]
-- [Hint 3: Don't forget to check that the action is valid using 'validWallAction'.]
reedPlayerAction :: Board -> [Player] -> String -> Int -> Maybe Action
reedPlayerAction b (p:ps) n r
  | boardSize /= 9 = error "Incorrect board size for reed"
  | turn p == 1 && correctWall (wallTop ('c',3)) = Just $ Place $ wallTop ('c',3)
  | turn p == 2 && correctWall (wallTop ('f',3)) = Just $ Place $ wallTop ('f',3)
  | otherwise = minimaxAction b (p:ps) n r
  where
      correctWall = validWallAction (Game b (p:ps)) 

-- We build a Reed player from a name, a starting cell, a number of walls, an array of winning
-- positions and 'commandToAction'.
makeReedPlayer :: String -> Cell -> Int -> [Cell] -> Player
makeReedPlayer n c rws wps = Player {
    name = n,
    turn = 1,
    currentCell = c, 
    remainingWalls = rws,
    winningPositions = wps,
    isHuman = False,
    chooseAction = reedPlayerAction } 
