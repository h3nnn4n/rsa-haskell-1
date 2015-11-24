import PrimeFunctions
import System.Environment
import System.IO
import System.IO.Error

genKey nK = p*q
    where
        (p,q) = checkEqual (getPrime 5 nK) (getPrime 5 nK) 5 nK

main = do
    args <- getArgs
    let bits = args !! 0

    print $ genKey (read bits :: Integer)

    return ()
