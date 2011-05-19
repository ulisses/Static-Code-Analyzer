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
import Data.ByteString.Internal
import Data.Word
import Data.List
import System.IO
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
physicalLines file = BS.readFile file >>= return . BS.count (c2w '\n')

{- This funtion receives the file where we want to test if hsa any clone code
   and the database of files under our system (this file contains the full path
   for other C files) => you can generate it executing:
       find / -iname "*.c" 2> /dev/null > database.txt
   
   And we return a list of the files where the cloning occur.
   We consider an occurrence as: one list of the line string and the line number.
-}
getClonesOneLine :: FilePath -> FilePath -> IO [(FilePath,[(String,[Int])])]
getClonesOneLine fp db =  getClonesByLine fp db
    >>= return
        . groupByFileName
        . groupBy (\(a,_,_) (b,_,_) -> a == b)
        . sortBy  (\(a,_,_) (b,_,_) -> EQ)

groupByFileName  :: [[(FilePath, String, [Int])]] -> [(FilePath, [(String, [Int])])]
groupByFileName [] = []
groupByFileName (h:t) | not $ null h = let fn = (\(a,_,_) -> a) $ head h
                                       in (fn,[ (s,l) | (fp,s,l) <- h]) : groupByFileName t
                      | otherwise = groupByFileName t

getClonesByLine :: FilePath -> FilePath -> IO [(FilePath, String, [Int])]
getClonesByLine fp db = do
    fps  <- readFile db >>= return . lines
    hss' <- mapM (flip openBinaryFile ReadMode) fps
    hss  <- mapM hGetContents hss'
    bss  <- (return . map lines) hss
    getClones' fp (zip fps bss)

getClones' :: FilePath -> [(String, [String])] -> IO [(FilePath, String, [Int])]
getClones' fn db = readFile fn >>= return . filterNonClone . fun
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
