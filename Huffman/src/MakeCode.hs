module MakeCode where

import Frequency 
import Types
import MakeTree

codes :: [Char] -> Tree
codes = makeTree.frequency
