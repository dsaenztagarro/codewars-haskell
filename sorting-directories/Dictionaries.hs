module Dictionaries where

sortDict :: Ord v => [(k,v)] -> [(k,v)]
sortDict dict = reverse $ qsort dict

qsort :: Ord v => [(k,v)] -> [(k,v)]
qsort [] = []
qsort (x:xs) = qsort lesser ++ equal ++ qsort greater
  where
    (lesser,equal,greater) = part x xs ([],[x],[])

part :: Ord v => (k,v) -> [(k,v)] -> ([(k,v)],[(k,v)],[(k,v)]) -> ([(k,v)],[(k,v)],[(k,v)])
part _ [] (l,e,g) = (l,e,g)
part p@(k,v) (x@(k',v'):xs) (l,e,g)
    | v' > v     = part p xs (l,e,x:g)
    | v' < v     = part p xs (x:l,e,g)
    | otherwise = part p xs (l,x:e,g)
