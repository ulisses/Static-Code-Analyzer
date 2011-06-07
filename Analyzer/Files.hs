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
module Files where

import System.IO.HVFS.Utils

{- Improve THIS!!!! -}
getListOfCFiles :: FilePath -> IO [FilePath]
getListOfCFiles fp = do
    c <- recurseDir SystemFS fp
             >>= return . filter ((==".c") . reverse . take 2 . reverse)
    h <- recurseDir SystemFS fp
             >>= return . filter ((==".h") . reverse . take 2 . reverse)
    return (c++h)
