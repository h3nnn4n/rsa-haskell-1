module Transmitter where

import Data.Char
import Math.NumberTheory.Moduli
import System.Random
import RsaFunctions
import PrimeFunctions

--asc2int_ :: [Int] -> Int -> [Integer]
asc2int_ [] _ = []
asc2int_ (x:xs) n = x * (255 ^ n) : asc2int_ (xs) (n+1)

--asc2int :: [Char] -> Integer
asc2int xs = sum $ asc2int_ ys 0
    where
        ys = map ord xs

--int2asc :: Integer -> [Int]
int2asc 0 = []
int2asc x = chr (fromInteger (x `mod` 255)) : int2asc (x `div` 255)

make4 xs = take 4 (xs ++ repeat ' ')

chop4 [] = []
chop4 xs = take 4 xs : chop4 (drop 4 xs)

joinBlocks [] = ""
joinBlocks (xs:xss) = xs ++ detToken ++ joinBlocks (xss)
    where
        detToken = if length xss /= 0 then ";" else ""

concatStrings [] = []
concatStrings (xs:xss) = xs ++ concatStrings (xss)
