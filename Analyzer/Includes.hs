------------------------------------------------------------------------------ 
-- | 
-- Author       : Ulisses Araujo Costa
-- Stability    : experimental
-- Portability  : portable
--
-- This module is part of 'Static-Code-Analyzer', a library to automatic
-- calculate some metrics related with C99 and GNU C extensions code.
--
-- In this module I implement the metrics related with #include pragma
--
------------------------------------------------------------------------------

module Includes where

import System.Process
import GHC.IO.Handle
import System.Exit
import Data.List
import Data.Char
import System.IO
import IO

import Metrics

{- This function returns the list of SystemIncludes
   by that we mean: #include <...>
   And the list of Includes: #include "..."
   
   Language.C does not show the includes we make, it just include
   directly all the code inside each included file, because
   it uses gcc preprocessor to do this work.
   So we will use a simple readFile and count the number of includes.
   
   The includes could be commented, so we filter the comments before
   take any action. The filter process is done by using
   runInteractiveCommand from System.Process, I tried to use 
   Haskell regexps implementations, but all of the really suck.
   So I am using a grep call directly.
-}
getIncludes :: FilePath -> IO Metrics
getIncludes file = do
    inph' <- try $ readFile file
    case inph' of
      (Left err) -> return emptyMetrics
      (Right inp) -> do
        code <- readProcess "grep" ["-v", "-P", "'(\\*(.|\n|\r)*?\\*)|(^[ \t\n]*\\/\\/.*)'"] inp
        let includes = map (dropWhile isSpace) $ filter (isInfixOf "#include") $ lines code
        let inc = takke '\"' $ map tail $ filter (not . null) $ droppe '\"' $ includes
        let sysInc = takke '>' $ map tail $ filter (not . null)  $ droppe '<' $ includes
        return (emptyMetrics >.> (("getIncludes",file,""),Includes (sysInc,inc)))
            where takke c  = map (takeWhile (/=c))
                  droppe c = map (dropWhile (/=c))
