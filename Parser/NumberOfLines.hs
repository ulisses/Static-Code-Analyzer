------------------------------------------------------------------------------ 
-- | 
-- Author       : Ulisses Araujo Costa
-- Stability    : experimental
-- Portability  : portable
--
-- This module is part of 'Static-Code-Analyzer', a library to automatic
-- calculate some metrics related with C99 and GNU C extensions code.
--
-- This module have some metrics related with number of lines of code and so
--
------------------------------------------------------------------------------

module NumberOfLines(ncloc,physicalLines) where

import Language.C
import Language.C.System.GCC
import Language.C.Data.Ident
import Language.C.Pretty

import qualified Data.ByteString as BS
import qualified Data.ByteString.Search as BSS
import qualified Data.ByteString.Char8 as BC
import Data.ByteString.Internal
import Data.Word

{- Get the number of lines, by this we mean:
   the number of lines of code, without blank lines
   and without comments.
-}
ncloc :: FilePath -> IO Int
ncloc file = do
    parse <- parseCFile (newGCC "gcc") Nothing ["-U__BLOCKS__"] file
    case parse of
        (Left err)   -> return 0
        (Right tree) -> (return . length . filter (not . null) . lines . show . pretty) tree

{- Get the number of physical lines, so, the real number of lines
   inside the file.
-}
physicalLines :: FilePath -> IO Int
physicalLines file = readFile file >>= return . length . lines

{-
-}
getClones :: FilePath -> IO [(String, [Int])]
getClones fn = BS.readFile fn >>= return . fun
    where fun cont = [ (BC.unpack $ removeRepeatedSpaces lin, BSS.indices (removeRepeatedSpaces lin) (removeRepeatedSpaces cont))
                                    | lin <- BS.split (c2w '\n') (removeRepeatedSpaces cont), not $ BS.null (removeRepeatedSpaces lin)]

removeRepeatedSpaces s | BS.null s        = s
                       | BS.length s == 1 = s
                       | otherwise        = if (BS.head s == (c2w ' ') && (BS.head . BS.drop 1) s == c2w ' ') then BS.tail s else s
