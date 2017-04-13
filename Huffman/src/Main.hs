module Main where

import Types
import Coding
import MakeCode
import CodeTable

-- This little supervised project taught me about code structure, patterns and modules.

testString = "battat"

huffTree = codes testString
huffTable = codeTable huffTree

codedMessage = codeMessage huffTable testString
decodedMessage = decodeMessage huffTree codedMessage

-- decodedMessage must be "battat" if I managed to code everything properly
main = print decodedMessage
