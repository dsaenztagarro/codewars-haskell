module Codewars.Kata.SumString where
import Data.List.Split
import Data.Char

sumFromString :: String -> Integer
sumFromString = sum . map read . wordsBy (not . isDigit)
