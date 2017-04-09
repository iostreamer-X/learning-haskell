module Frequency where

mergeSort merge list
  |length list < 2 = list
  |otherwise 
     = (mergeSort merge first) `merge` (mergeSort merge last)
     where
       first = take half list
       last  = drop half list
       half  = div (length list) 2

alphaMerge xs [] = xs
alphaMerge [] ys = ys
alphaMerge ((c1,f1):xs) ((c2,f2):ys) 
  |c1==c2 = (c1,f1+f2):alphaMerge xs ys
  |c1<c2  = (c1,f1):alphaMerge xs ((c2,f2):ys)
  |otherwise = (c2,f2):alphaMerge ((c1,f1):xs) ys

freqMerge xs [] = xs
freqMerge [] ys = ys
freqMerge ((c1,f1):xs) ((c2,f2):ys)
  |f1>=f2 = (c1,f1):freqMerge xs ((c2,f2):ys)
  |f1<f2 = (c2,f2):freqMerge ((c1,f1):xs) ys

frequency :: [Char] -> [(Char,Int)]
frequency = mergeSort freqMerge . mergeSort alphaMerge . map (\c->(c,1))
