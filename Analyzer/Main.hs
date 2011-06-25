{-#OPTIONS -XScopedTypeVariables
           -XNoMonomorphismRestriction
           -XFlexibleInstances
           -XUndecidableInstances
           -XTupleSections
#-}
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

import System.Process
import System.Exit
import System.Environment
import System.IO
import IO
import GHC.IO.Handle
import GHC.IO
import qualified Data.ByteString as BS
import qualified Control.Monad.Parallel as P
import qualified System.IO.Strict as S
import Data.Data
import Data.Monoid
import Data.Maybe
import Control.Monad
import Control.Monad.Loops

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
import Pdf
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
main = do
    args <- getArgs
    (flag, lstr) <- compilerOpts args
    let inp = getInput flag
    let (format,out) = getOutput flag
    execAllMetrics inp >>=
        (case format of
            XML   -> generateXML   out
            PDF   -> generatePDF   out
            LATEX -> generateLatex out
        )

execAllMetrics :: FilePath -> IO Metrics
execAllMetrics fp = do
    lfp    <- getListOfCFiles fp
    print $ length lfp
    lstT   <- getTreeFromFile fp lfp
    print $ length lstT
    --dbFile <- getDBFileContents "database.txt"
    getMetrics [getMetricsFrom mccabePerFun lstT
               ,getMetricsFrom generateGraphVizFromFile lfp
               ,generateGraphVizFromProject lfp
               ,getMetricsFrom getNrOfLinesOfComments lfp
               ,getMetricsFrom commentLinesDensity lstT
               ,getMetricsFrom fromSigToM lstT
               ,getMetricsFrom ncloc lstT
               ,getMetricsFrom physicalLines lfp
               --,getMetricsFrom getClonesBlock (zip lfp (repeat dbFile))
               ]

getDBFileContents :: FilePath -> IO [(FileDst,String)]
getDBFileContents db = do
    fc <- S.readFile db >>= return . lines
    hss' <- forkMapM (flip openBinaryFile ReadMode) fc >>= return . concatMap (either (const []) (:[]))
    hss  <- forkMapM hGetContents hss' >>= return . concatMap (either (const []) (:[]))
    forkMapM hClose hss'
    return $ zip fc hss

getContentFromFile :: [FilePath] -> IO [(FilePath,[String])]
getContentFromFile [] = return []
getContentFromFile (fp:t) = do
    eith <- try $ S.readFile fp
    case eith of
        (Left err) -> print err >> getContentFromFile t
        (Right co) -> getContentFromFile t >>= return . (\r -> (fp,lines co) : r)

getTreeFromFile :: FilePath -> [FilePath] -> IO [(FilePath,CTranslUnit)]
getTreeFromFile _ [] = return []
getTreeFromFile dir (fp:t) = do
    path <- mkAbsolutePath dir
    r <- try $ parseCFile (newGCC "gcc") Nothing ["-U__BLOCKS__","-I"++path] fp
    case r of
        (Left _)    -> getTreeFromFile dir t
        (Right res) -> do
            case res of
                (Left _) -> getTreeFromFile dir t
                (Right tree) -> getTreeFromFile dir t >>= return . \r -> (fp,tree):r

getTreeFromFileF :: FilePath -> [FilePath] -> IO [(FilePath,CTranslUnit)]
getTreeFromFileF dir l =
    forkMapM (getTreeFromFile' dir) l
        >>= return . concatMap (either (const []) (maybe [] (:[])))

getTreeFromFile' :: FilePath -> FilePath -> IO (Maybe (FilePath,CTranslUnit))
getTreeFromFile' dir fp = do
    path <- mkAbsolutePath dir
    r <- try $ parseCFile (newGCC "gcc") Nothing ["-U__BLOCKS__","-I"++path,"-Iinclude/","-Iarch/x86/include"] fp
    case r of
        (Left _)    -> return Nothing
        (Right res) -> do
            case res of
                (Left _) -> return Nothing
                (Right tree) -> return $ Just (fp,tree)
