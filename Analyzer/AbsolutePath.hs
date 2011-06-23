------------------------------------------------------------------------------ 
-- | 
-- Author       : Ulisses Araujo Costa
-- Stability    : experimental
-- Portability  : portable
--
-- This module is part of 'Static-Code-Analyzer', a library to automatic
-- calculate some metrics related with C99 and GNU C extensions code.
--
-- This is an auxiliar module to get the absolute path of a file/folder
--
------------------------------------------------------------------------------
module AbsolutePath where

import System.Directory
import System.Path.NameManip
import System.IO.Unsafe

mkAbsolutePath :: FilePath -> IO FilePath
mkAbsolutePath fp = do
    d <- getCurrentDirectory
    let lstDot = takeWhile (=="..") $ slice_path $ normalise_path fp
    let n = length lstDot
    let rest = unslice_path $ dropWhile (=="..") $ slice_path $ normalise_path fp
    return $ if n==0 then fp else normalise_path $ unsplit_path (remove n d,rest)
    where remove 0 s = s
          remove n s = remove (n-1) $ dir_part s

mkAbsolutePathUnsafe :: FilePath -> FilePath
mkAbsolutePathUnsafe = unsafePerformIO . mkAbsolutePath
