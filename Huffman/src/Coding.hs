module Coding(codeMessage, decodeMessage) where

import Types

codeMessage :: Table->[Char]->HCode
getFromTable :: Table->Char->HCode

getFromTable [] _ = error "Empty Table"
getFromTable ((c,hc):rest) char
  |c==char = hc
  |otherwise = getFromTable rest char

codeMessage table = concat.map (getFromTable table)


decodeMessage :: Tree->HCode->[Char]

decodeMessage tree 
  = decode tree
    where
    decode (Node _ lt _) (L:xs) = decode lt xs
    decode (Node _ _ rt) (R:xs) = decode rt xs
    decode (Leaf ch _) hc = ch : decode tree hc 	 
    decode t [] = []


