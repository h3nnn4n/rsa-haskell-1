import PrimeFunctions
import System.Environment
import System.IO
import System.IO.Error

genKey nK = p*q
    where
        (p,q) = checkEqual (getPrime 32 nF ) (getPrime 32 nF) 32 nF
        nF = (nK `div` 2 ) + 1 

main = do
    args <- getArgs
    let bits = args !! 0

    print $ genKey (read bits :: Integer)

    return ()
