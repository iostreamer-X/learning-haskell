module MakeTree where

import Types

makeTree :: [(Char,Int)] -> Tree
makeCodes :: [Tree] -> Tree
toTreeList :: [(Char,Int)] -> [Tree]

makeTree = makeCodes.toTreeList

toTreeList = map (uncurry Leaf)
makeCodes [t] = t
makeCodes ts = makeCodes (amalgamate ts)

-- This has a bit of my own sauce as the assignment expected me to come up with the insert function.
-- The synergy between 'makeCodes' and 'amalgamate' taught me the importance of modularizing and also
-- how one can achieve all this without loops. But honestly, dumping good ol loops and coming up with
-- equivalent recursions is hard.
amalgamate :: [Tree] -> [Tree]
amalgamate (t1:t2:rest) 
  = (buildTree t1 t2) : rest
  where 
  buildTree = Node (value t1 + value t2) 
  value (Leaf _ n) =  n
  value (Node n _ _) = n 
