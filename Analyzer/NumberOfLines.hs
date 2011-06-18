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

module NumberOfLines(ncloc, physicalLines
                    -- ,densityOfDuplicatedLinesBlock, nrOfFilesDuplicatedLineBlock
                    ,getClonesBlock
                    -- ,densityOfDuplicatedLinesOneLine, nrOfFilesDuplicatedLineOneLine
                    ,getClonesOneLine
                    ) where

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

import Metrics

{- Get the number of lines, by this we mean:
   the number of lines of code, without blank lines
   and without comments.
-}
ncloc :: (FilePath,CTranslUnit) -> IO Metrics
ncloc (file,tree) = let len = (length . filter (not . null) . lines . show . pretty) tree
             in return $ emptyMetrics >.> (("ncloc",file,""),Num $ fromIntegral len)

{- Get the number of physical lines, so, the real number of lines
   inside the file.
-}
physicalLines :: FilePath -> IO Metrics
physicalLines file = do
    len <- BS.readFile file >>= return . BS.count (c2w '\n')
    return $ emptyMetrics >.> (("physicalLines",file,""),Num $ fromIntegral len)

{-Density of duplicated lines for a block
-}
--densityOfDuplicatedLinesBlock :: FilePath -> FilePath -> IO Metrics
--densityOfDuplicatedLinesBlock = densityOfDuplicatedLines nrOfFilesDuplicatedLineBlock

{- Count the number of files that have at least one duplicated block
-}
--nrOfFilesDuplicatedLineBlock :: FilePath -> FilePath -> IO Int
--nrOfFilesDuplicatedLineBlock = nrOfFilesDuplicatedLine getClonesBlock

{- Get the clones for a blokc of contiguous lines
-}
getClonesBlock :: (FilePath,[String]) -> IO Metrics
getClonesBlock (fp,fps) = do
    lst <- getClonesByBlock fp fps
        >>= return
            . groupByFileName
            . groupBy (\(a,_,_,_) (b,_,_,_) -> a == b)
            . sortBy  (\(a,_,_,_) (b,_,_,_) -> EQ)
    return (emptyMetrics >.> (("getClonesBlock",fp,""), Clone lst))

getClonesByBlock fp fps = do
    hss' <- mapM (flip openBinaryFile ReadMode) fps
    hss  <- mapM hGetContents hss'
    getClones'' fp (zip fps hss)

blocks :: Int -> String -> [String]
blocks n "" = []
blocks n l = let lk = take n $ lines l
                 lklen = length lk
                 lkcat = concat $ intersperse "\n" lk
                 lkcatRec = head lk ++ "\n"
                 (Just t) = stripPrefix lkcatRec l
             in if (lklen < n) then [lkcat] else lkcat : blocks n t

getClones'' fn db = readFile fn >>= return . filterNonClone . fun
    where
          fun src = [ (fn', lin, nr, find lin (blocks 3 db') ) | (fn', db') <- db, (nr,lin) <- zip [1..] $ blocks 3 $ src ]
          find lin db = let l = map (+1) $ findIndices (==lin) db
                        in if l == [] then 0 else head l
          filterNonClone = filter (not . null . two    )
                         . filter (not . (==0) . four )
                         . filter (not . (<=10) . length . two )
          two   = (\(_,b,_,_) -> b)
          four  = (\(_,_,_,d) -> d)

{-Density of duplicated lines for one line duplication
-}
--densityOfDuplicatedLinesOneLine :: FilePath -> FilePath -> IO Double
--densityOfDuplicatedLinesOneLine = densityOfDuplicatedLines nrOfFilesDuplicatedLineOneLine

{- Count the number of files that have at least one duplicated line
-}
--nrOfFilesDuplicatedLineOneLine :: FilePath -> FilePath -> IO Int
--nrOfFilesDuplicatedLineOneLine = nrOfFilesDuplicatedLine getClonesOneLine

{- This funtion receives the file where we want to test if hsa any clone code
   and the database of files under our system (this file contains the full path
   for other C files) => you can generate it executing:
       find / -iname "*.c" 2> /dev/null > database.txt
   
   And we return a list of the files where the cloning occur.
   We consider an occurrence as: one list of the line string and the line number.
-}
getClonesOneLine :: FilePath -> FilePath -> IO [(String, [(String, Int, Int)])]
getClonesOneLine fp db =  getClonesByLine fp db
    >>= return
        . groupByFileName
        . groupBy (\(a,_,_,_) (b,_,_,_) -> a == b)
        . sortBy  (\(a,_,_,_) (b,_,_,_) -> EQ)

groupByFileName [] = []
groupByFileName (h:t) | not $ null h = let fn = (\(a,_,_,_) -> a) $ head h
                                       in (fn,[ (n,s,l) | (fp,n,s,l) <- h]) : groupByFileName t
                      | otherwise = groupByFileName t

getClonesByLine fp db = do
    fps  <- readFile db >>= return . lines
    hss' <- mapM (flip openBinaryFile ReadMode) fps
    hss  <- mapM hGetContents hss'
    bss  <- (return . map lines) hss
    getClones' fp (zip fps bss)

getClones' fn db = readFile fn >>= return . filterNonClone . fun
    where
          fun src = [ (fn', lin, nr, find lin db' ) | (fn', db') <- db, (nr,lin) <- zip [1..] (map removeRepeatedSpaces $ lines src) ]
          find lin db = let l = map (+1) $ findIndices (==lin) db
                        in if l == [] then 0 else head l 
          filterNonClone = filter (not . null . two    )
                         . filter (not . (==0) . four )
                         . filter (not . (=="}") . two )
                         . filter (not . (=="{") . two )
                         . filter (not . (=="/*") . two)
                         . filter (not . (=="*/") . two)
          one   = (\(a,_,_,_) -> a)
          two   = (\(_,b,_,_) -> b)
          three = (\(_,_,c,_) -> c)
          four  = (\(_,_,_,d) -> d)

removeRepeatedSpaces = dropWhile (== ' ') . removeRepeatedSpaces_

removeRepeatedSpaces_ s | null s        = s
                        | length s == 1 = s
                        | head s == (' ') && (head . drop 1) s == ' ' = removeRepeatedSpaces $ tail s
                        | otherwise = s

{- Auxiliar functions related with clone detection
-}

{-densityOfDuplicatedLines :: FilePath -> FilePath -> IO Double
densityOfDuplicatedLines f fp db = do
    dl <- f fp db
    phyM <- physicalLines fp
    let phy = getM ("physicalLines",fp,"") phyM
    return (( dl / phy) * 100)
-}
--nrOfFilesDuplicatedLine :: FilePath -> FilePath -> IO Int
nrOfFilesDuplicatedLine f fp db = f fp db >>= return . length . groupBy (\(_,a,_) (_,b,_) -> a == b) . concatMap snd
