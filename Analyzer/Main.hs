{-#OPTIONS -XScopedTypeVariables -XNoMonomorphismRestriction -XFlexibleInstances -XUndecidableInstances#-}
------------------------------------------------------------------------------ 
-- | 
-- Author       : Ulisses Araujo Costa
-- Stability    : experimental
-- Portability  : portable
--
-- This module is part of 'Static-Code-Analyzer', a library to automatic
-- calculate some metrics related with C99 and GNU C extensions code.
--
------------------------------------------------------------------------------
module Main where

import IO
import System.Process
import GHC.IO.Handle
import GHC.IO
import System.Exit
import System.Environment
import Data.Data
import Data.Monoid
import Data.Maybe
import qualified Data.ByteString as BS
import Control.Monad
import Data.Maybe ( fromMaybe )
import qualified Control.Monad.Parallel as P
import qualified System.IO.Strict as S
import System.IO

import Language.C
import Language.C.System.GCC
import Language.C.Data.Ident
import Language.C.Pretty
import Strafunski.Data.Generics.Strafunski.StrategyLib.ChaseImports
import Strafunski.Data.Generics.Strafunski.StrategyLib.StrategyPrimitives
import Strafunski.Data.Generics.Strafunski.StrategyLib.TraversalTheme
import Strafunski.Data.Generics.Strafunski.StrategyLib.StrategyPrelude
import Strafunski.Data.Generics.Strafunski.StrategyLib.FlowTheme

import Comments
import NumberOfLines
import Metrics
import Includes
import NumberOfLines
import Complexity
import Functions
import AbsolutePath
import Files
import Latex
import XML
import GraphViz
import Flags

{- Main -}
{- We may need to import some libraries to be able to put the input code
   to work, so we must say it to GCC like this:
   stream <- parseCFile (newGCC "gcc") Nothing ["-Idir"] file
   where 'dir' is the directory where our code is.
   This flag is passed as it is directly to GCC, so is just an common import.
process :: String -> IO ()
process file = do
    -- This version of Language.C does not support BLOCKS notation from MacOSX,
    -- so we need to undefine them... It is not pretty, but is a fast solution to get our code being parsed
    stream <- parseCFile (newGCC "gcc") Nothing ["-U__BLOCKS__"] file
    case stream of
        ( Left error  ) -> print error
        ( Right cprog ) -> (putStr . unlines  . map (show . pretty) . getFunctionsSignFromC) cprog
-}

execAllMetrics :: FilePath -> IO Metrics
execAllMetrics fp = do
    lfp    <- getListOfCFiles fp
    lstT   <- getTreeFromFile lfp
    dbFile <- getDBFileContents
    complexityM          <- mapM mccabePerFun lstT >>= return . concatMetrics
    includesM            <- mapM getIncludes lfp >>= return . concatMetrics
    linesOfCommentsM     <- mapM getNrOfLinesOfComments lfp >>= return . concatMetrics
    linesOfCommentsDensM <- mapM commentLinesDensity lstT >>= return . concatMetrics
    lcommM               <- mapM getNrOfLinesOfComments lfp >>= return . concatMetrics
    --contentsM            <- mapM getClonesBlock (zip lfp (repeat dbFile)) >>= return . concatMetrics
    return $
        complexityM
        >+> includesM
        >+> linesOfCommentsM
        -- >+> contentsM
        >+> lcommM
        >+> linesOfCommentsDensM

getDBFileContents ::  IO [(FileDst,String)]
getDBFileContents = do
    fc <- S.readFile "database.txt" >>= return . lines
    hss' <- P.mapM (flip openBinaryFile ReadMode) fc
    hss  <- P.mapM hGetContents hss'
    --mapM hClose hss'
    return $ zip fc hss

getContentFromFile :: [FilePath] -> IO [(FilePath,[String])]
getContentFromFile [] = return []
getContentFromFile (fp:t) = do
    eith <- try $ S.readFile fp
    case eith of
        (Left err) -> print err >> getContentFromFile t
        (Right co) -> getContentFromFile t >>= return . (\r -> (fp,lines co) : r)

getTreeFromFile :: [FilePath] -> IO [(FilePath,CTranslUnit)]
getTreeFromFile [] = return []
getTreeFromFile (fp:t) = do
    r <- try $ parseCFile (newGCC "gcc") Nothing ["-U__BLOCKS__","-I../../gcc-4.6.0/","-I.","-I/Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/gcc-4.6.0/gcc/","-I/Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/gcc-4.6.0"] fp
    case r of
        (Left _)    -> getTreeFromFile t
        (Right res) -> do
          case res of
              (Left _)     -> getTreeFromFile t
              (Right tree) -> getTreeFromFile t >>= return . (\r -> (fp,tree) : r)

main :: IO ()
main = do
    (dir:_) <- getArgs
    m <- execAllMetrics dir
    print m
    generatePDF m
