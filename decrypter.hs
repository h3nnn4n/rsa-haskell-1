import Transmitter
import RsaFunctions
import Data.List
import Data.List.Split
import Data.Char
import System.Environment
import System.IO
import System.IO.Error

main = do
    args <- getArgs
    nd <- readFile (head args)
    toBeDecrypted <- readFile (args !! 1)
    let privKey = splitOn ";" nd
        string_blocks = splitOn ";" toBeDecrypted
        int_blocks = map (\x -> read x :: Integer) string_blocks
        decrypted = decrypt int_blocks ((read (privKey !! 0) :: Integer), (read (privKey !! 1) :: Integer))
        asc_blocks = map int2asc decrypted
        output = concatStrings asc_blocks 
    writeFile (args !! 2) output
    return ()
