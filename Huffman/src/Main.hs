module Main where

import Types
import Coding
import MakeCode
import CodeTable


testString = "battat"

huffTree = codes testString
huffTable = codeTable huffTree

codedMessage = codeMessage huffTable testString
decodedMessage = decodeMessage huffTree codedMessage

main = print decodedMessage
