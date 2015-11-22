import Data.Char
import Math.NumberTheory.Moduli
import System.Random

asc2int :: [Integer] -> Integer
asc2int = foldr (\x y -> x + 255 * y) 0

int2asc :: Integer -> [Integer]
int2asc 0 = []
int2asc x = x `mod` 255 : int2asc (x `div` 255)

make4 xs = take 4 (xs ++ repeat ' ')

chop4 [] = []
chop4 xs = take 4 xs : chop4 (drop 4 xs)

encode xs = map asc2int yss
    where
        xss = chop4 xs
        yss = [map ord ss | ss <- xss]

cipher xs (n,e) = [map chr as | as <- ascBlocks]
    where
        intBlocks = encode xs
        cryptApplied = crypt intBlocks (n,e)
        ascBlocks = map int2asc cryptApplied
