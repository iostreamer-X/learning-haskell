module CodeTable where

import Types

convert :: HCode -> Tree -> Table
convert codes (Leaf c _) = [(c,codes)]
convert codes (Node _ t1 t2) = (convert (codes++[L]) t1) ++ (convert (codes++[R]) t2)

codeTable :: Tree -> Table
codeTable = convert []
