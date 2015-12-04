module RsaFunctions where

import Math.NumberTheory.Moduli
import PrimeFunctions

gcdExt a 0 = (1, 0, a)
gcdExt a b = let (q, r) = a `quotRem` b
                 (s, t, g) = gcdExt b r
             in (t, s - q * t, g)
 
modInv a m = let (i, _, g) = gcdExt a m
             in if g == 1 then det i else 0
  where det x = if x < 0 then x + m else x


genKeys nE nK = [(p*q,e), (p*q,d)]
    where
        (p,q) = checkEqual (getPrime 32 nF) (getPrime 32 nF) 32 nF
        nF = (nK `div` 2 ) + 1
        e = getPrime 32 nE
        d = modInv e ((p-1)*(q-1))

crypt :: [Integer] -> (Integer,Integer) -> [Integer]
crypt xs (n,e) = map (\x -> powerMod x e n) xs

decrypt :: [Integer] -> (Integer,Integer) -> [Integer]
decrypt xs (n,d) = map (\x -> powerMod x d n) xs
