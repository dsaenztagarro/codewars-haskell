module Codewars.Kata.SumString.Solution2 where

import Data.Char (isDigit)

sumFromString :: String -> Integer
sumFromString xs = sum numbers
    where numbers = map (\xs -> (read xs) :: Integer) (matches xs)

matches :: String -> [String]
matches xs = snd $ foldr addNumbers (False, []) xs

addNumbers :: Char -> (Bool, [String]) -> (Bool, [String])
addNumbers x (False, []) = if isDigit x then (True, [[x]]) else (False, [])
addNumbers x (isDigitLast, list@(y:ys)) = (flag, newlist)
  where
    flag = isDigit x
    newlist = if flag
              then if isDigitLast then (x:y):ys else [x]:list
              else list
