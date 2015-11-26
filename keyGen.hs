import PrimeFunctions
import System.Environment
import System.IO
import System.IO.Error

genKey nK = p*q
    where
        (p,q) = checkEqual (getPrime 5 nF) (getPrime 5 nF) 5 nF
        nF = (nK `div` 2 ) + 1

main = do
    args <- getArgs
    let bits = args !! 0

    print $ genKey (read bits :: Integer)

    return ()
