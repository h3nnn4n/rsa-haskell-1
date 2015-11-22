import PrimeFunctions
import System.Environment
import System.IO
import System.IO.Error

primesPrimesprimes = 2 : [x | x <- [3,5..], isPrime x 5]

breaker n = (p,q)
    where
        p = head $ dropWhile (\x -> n `mod` x /= 0) primesPrimesprimes
        q = n `div` p 

main = do
    key' <- getLine
    let key = read key' :: Integer

    print $ key
    print $ breaker key 

    return ()
