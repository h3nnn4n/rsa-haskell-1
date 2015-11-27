import RsaFunctions
import System.Environment
import System.IO
import System.IO.Error
import Data.List
import Data.List.Split

main = do 
    args <- getArgs
    let nE = read (args !! 0) :: Integer
        nK = read (args !! 1) :: Integer
        keys = genKeys nE nK
    writeFile "public.txt" $ show (fst (keys !! 0)) ++ ";" ++ show (snd (keys !! 0))
    writeFile "private.txt" $ show (fst (keys !! 1)) ++ ";" ++ show (snd (keys !! 1))
    return ()
