module Dictionaries.Mysolutions where

sortDict :: Ord v => [(k,v)] -> [(k,v)]
sortDict dict = qsort dict

-- implementation 1

qsort' :: Ord v => [(k,v)] -> [(k,v)]
qsort' [] = []
qsort' (x:xs) = qsort' lesser ++ equal ++ qsort' greater
  where
    (lesser,equal,greater) = part x xs ([],[x],[])

part :: Ord v => (k,v) -> [(k,v)] -> ([(k,v)],[(k,v)],[(k,v)]) -> ([(k,v)],[(k,v)],[(k,v)])
part _ [] (l,e,g) = (l,e,g)
part p@(k,v) (x@(k',v'):xs) (l,e,g)
    | v' > v     = part p xs (l ++ [x],e,g)
    | v' < v     = part p xs (l,e,g ++ [x])
    | otherwise = part p xs (l,e ++ [x],g)

-- implementation 2

qsort :: Ord v => [(k,v)] -> [(k,v)]
qsort [] = []
qsort (x@(_,v):xs) = (qsort greater) ++ [x] ++ equals ++ (qsort lesser)
  where
    lesser = filter (\(_,v') -> v' < v) xs
    greater = filter (\(_,v') -> v' > v) xs
    equals = filter (\(_,v') -> v' == v) xs
