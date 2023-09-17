module Renderer.Utils.List

import Data.List

public export
qsort: (a -> a -> Ordering) -> List a -> List a
qsort cmp [] = []
qsort cmp [x] = [x]    
qsort cmp (x::xs) = let (head, tail) = partition ((== GT) . (cmp x)) xs in
                        qsort cmp head ++ x::(qsort cmp tail)

public export
containsBy: (a -> Bool) -> List a -> Bool
containsBy cmp list = case (find cmp list) of Just _ => True; Nothing => False