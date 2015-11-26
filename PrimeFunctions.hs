module PrimeFunctions where

import Math.NumberTheory.Moduli
import System.Random
import Control.Monad
import System.IO.Unsafe -- ( ͡° ͜ʖ ͡°)

sumT (a,b) (c,d) = (a+c,b+d)

findfactor x | x `mod` 2 /= 0 = (0,x)
             | otherwise = sumT (1,0) (findfactor (x `div` 2)) 


isWit_ :: Integer -> Integer -> Integer -> Integer -> Integer -> Bool
isWit_ n a s d i | i == s = True
                 | i == 0 && (pwrmd == 1 || pwrmd == (n-1)) = False
                 | i /= 0 && pwrmd == (n-1) = False
                 | otherwise = isWit_ n a s d (i+1) 
    where
        pwrmd = powerMod a (d * (2 ^ i)) n 

isWit ::  Integer -> Integer -> Bool
isWit n a | n `mod` 2 == 0 = True -- The Number is even
          | otherwise = isWit_ n a s d 0
    where
        (s,d) = findfactor (n-1)

isPrime :: Integer -> Int -> Bool
isPrime n k
    | k == 0 = False
    | n < 2 = False
    | n `mod` 2 == 0 = False
    | otherwise = not $ foldr (||) False wit
    where
        wit = map (\a -> isWit_ n a s d 0) (witnesses k n) 
        (s,d) = findfactor (n-1)

witnesses :: Int -> Integer -> [Integer]
witnesses k n = unsafePerformIO (randomListGenerator k n) -- Born to be wild baby

randomListGenerator :: Int -> Integer -> IO [Integer]
randomListGenerator k n = do g <- newStdGen
                             return $ take k (randomRs (2, n-1) g)

randomRangeGenerator :: Int-> Integer -> IO [Integer]
randomRangeGenerator k n = do g <- newStdGen
                              return $ take k (randomRs (2 ^ (n-1), (2^(n))-1) g)

randomRangeNumbers :: Int-> Integer -> [Integer]
randomRangeNumbers k n = unsafePerformIO (randomRangeGenerator k (n))

-- k is the miller-rabin test accurancy (numer of witnesses), n is the number os bits
getPrime :: Int -> Integer -> Integer
getPrime k n = head $ dropWhile (\x -> not (isPrime x k)) (randomRangeNumbers 10000000000000000 n)

checkEqual :: Integer -> Integer -> Int -> Integer -> (Integer,Integer)
checkEqual p q k n
	| p /= q = (p,q)
	| otherwise = checkEqual p (getPrime k n) k n 
