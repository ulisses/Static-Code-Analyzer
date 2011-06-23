------------------------------------------------------------------------------ 
-- | 
-- Author       : Ulisses Araujo Costa
-- Stability    : experimental
-- Portability  : portable
--
-- This module is part of 'Static-Code-Analyzer', a library to automatic
-- calculate some metrics related with C99 and GNU C extensions code.
--
-- In this module I implement files related metrics
--
------------------------------------------------------------------------------
module Files(getListOfCFiles) where

import System.IO.HVFS.Utils

{- Improve THIS!!!!
getListOfCFiles :: FilePath -> IO [FilePath]
getListOfCFiles fp = recurseDir SystemFS fp >>= return . filter (cOrh . last2)
    where cOrh s = s == ".c" || s == ".h"
-}

getListOfCFiles :: FilePath -> IO [FilePath]
getListOfCFiles fp = do
    c <- recurseDir SystemFS fp
             >>= return . filter ((==".c") . last2)
    h <- recurseDir SystemFS fp
             >>= return . filter ((==".h") . last2)
    return (c++h)

last2 s | length s == 2 = s
        | length s < 2 = []
        | otherwise = last2 $ drop 2 s
