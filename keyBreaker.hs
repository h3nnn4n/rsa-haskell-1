import PrimeFunctions
import System.Environment
import System.IO
import System.IO.Error

primes = [2..]

sieve (x:xs) = x : (sieve (filter (notMultiple x) xs))

notMultiple x y
    | y `mod` x == 0 = False
    | otherwise = True

breaker n = (p,q)
    where
        p = head $ dropWhile (\x -> n `mod` x /= 0) (sieve primes)
        q = n `div` p 

main = do
    key' <- getLine
    let key = read key' :: Integer

    print $ key
    print $ breaker key 

    return ()
