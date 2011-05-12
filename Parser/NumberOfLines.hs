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
