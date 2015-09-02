module Dictionaries where
import Data.List (sortBy)
import Data.Ord  (comparing)

sortDict :: Ord v => [(k,v)] -> [(k,v)]
sortDict = sortBy (flip $ comparing snd)
