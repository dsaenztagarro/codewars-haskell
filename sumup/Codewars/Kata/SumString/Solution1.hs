module Codewars.Kata.SumString.Solution1 where

import Text.Regex.Posix

sumFromString :: String -> Integer
sumFromString xs = sum numbers
    where
      matches = xs =~ "[0-9]+" :: [[String]]
      numbers = map (\xs -> (read . head $ xs) :: Integer) matches
