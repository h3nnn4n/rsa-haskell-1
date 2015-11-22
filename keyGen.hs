import PrimeFunctions
import System.Environment
import System.IO
import System.IO.Error

genKey nK = p*q
    where
        p = getPrime 5 nK 
        q = getPrime 5 nK 

main = do
    args <- getArgs
    let bits = args !! 0

    print $ genKey (read bits :: Integer)

    return ()
