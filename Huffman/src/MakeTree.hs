module MakeTree where

import Types

makeTree :: [(Char,Int)] -> Tree
makeCodes :: [Tree] -> Tree
toTreeList :: [(Char,Int)] -> [Tree]

makeTree = makeCodes.toTreeList

toTreeList = map (uncurry Leaf)
makeCodes [t] = t
makeCodes ts = makeCodes (amalgamate ts)

amalgamate :: [Tree] -> [Tree]
amalgamate (t1:t2:rest) 
  = (buildTree t1 t2) : rest
  where 
  buildTree = Node (value t1 + value t2) 
  value (Leaf _ n) =  n
  value (Node n _ _) = n 
