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

module NumberOfLines where

import Language.C
import Language.C.System.GCC
import Language.C.Data.Ident
import Language.C.Pretty

import qualified Data.ByteString as BS
import qualified Data.ByteString.Search as BSS
import qualified Data.ByteString.Char8 as BC
import Data.ByteString.Internal
import Data.Word
import Data.List
import System.IO
import qualified System.IO.Strict as S
import qualified Data.Text.IO as TIO
import qualified Data.Text as T

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

getClones_ fp = do
    fps  <- readFile "db.txt" >>= return . lines
    hss' <- mapM (flip openBinaryFile ReadMode) fps
    hss  <- mapM hGetContents hss'
    bss  <- (return . map lines) hss
    getClones fp (zip fps bss)

--getClones :: FilePath -> [(FilePath,ByteString)] -> IO [(String, [Int])]
getClones fn db = readFile fn >>= return . filterNonClone . fun
    where
          fun src = [ (fn', lin, findIndices (==lin) db') | (fn', db') <- db, lin <- map removeRepeatedSpaces $ lines src ]
          filterNonClone = filter (not . null . two    )
                         . filter (not . null . three  )
                         . filter (not . (=="}") . two )
                         . filter (not . (=="{") . two )
                         . filter (not . (=="/*") . two)
                         . filter (not . (=="*/") . two)
          one   = (\(a,_,_) -> a)
          two   = (\(_,b,_) -> b)
          three = (\(_,_,c) -> c)

removeRepeatedSpaces = dropWhile (== ' ') . removeRepeatedSpaces_

removeRepeatedSpaces_ s | null s        = s
                        | length s == 1 = s
                        | head s == (' ') && (head . drop 1) s == ' ' = removeRepeatedSpaces $ tail s
                        | otherwise = s
