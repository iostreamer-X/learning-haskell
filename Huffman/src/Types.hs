module Types where

data Bit = L | R deriving (Show,Eq)
type HCode = [Bit]
type Table = [(Char,HCode)]

data Tree = Node Int Tree Tree|
            Leaf Char Int


