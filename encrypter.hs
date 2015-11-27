import Transmitter
import Data.List
import Data.List.Split
import Data.Char
import System.Environment
import System.IO
import System.IO.Error

main = do
    args <- getArgs
    ne <- readFile (head args)
    toBeCrypted <- readFile (args !! 1) 
    let pKey = splitOn ";" ne
        int_blocks = map asc2int (chop4 toBeCrypted)
        crypted = crypt int_blocks ((read (key !! 0) :: Integer), (read (key !! 1) :: Integer))
        string_blocks = map show crypted
        output = joinBlocks string_blocks
    writeFile (args !! 2) output
    return () 
