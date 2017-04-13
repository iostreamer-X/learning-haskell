module CodeTable where

import Types

convert :: HCode -> Tree -> Table
convert codes (Leaf c _) = [(c,codes)]
-- This level of one liner is what I aim to achieve. 
convert codes (Node _ t1 t2) = (convert (codes++[L]) t1) ++ (convert (codes++[R]) t2)

codeTable :: Tree -> Table
codeTable = convert []
