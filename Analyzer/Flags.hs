------------------------------------------------------------------------------ 
-- | 
-- Author       : Ulisses Araujo Costa
-- Stability    : experimental
-- Portability  : portable
--
-- This module is part of 'Static-Code-Analyzer', a library to automatic
-- calculate some metrics related with C99 and GNU C extensions code.
--
-- This module has the responsibility to talk with the world
--
------------------------------------------------------------------------------
module Flags where

import System.Console.GetOpt
import System.Environment
import Data.Maybe

data Flag  = Input String
           | Output Format String
    deriving Show

data Format = XML | PDF | LATEX
    deriving Show

options :: [OptDescr Flag]
options =
    [ Option ['x'] ["outputXML"]  (OptArg (out XML) "FILE")   "output in XML format to FILE, default: FILE=output.xml"
    , Option ['p'] ["outputPDF"]  (OptArg (out PDF) "FILE")   "output in PDF format to FILE, default: FILE=output.pdf"
    , Option ['t'] ["outputTEX"]  (OptArg (out LATEX) "FILE") "output in LaTeX format to FILE, default: FILE=output.tex"
    , Option ['i'] ["input"]      (ReqArg Input  "DIR")      "input directory"
    ]

out :: Format -> Maybe String -> Flag
out XML   = Output XML . fromMaybe "output.xml"
out PDF   = Output PDF . fromMaybe "output.pdf"
out LATEX = Output LATEX . fromMaybe "output.tex"

compilerOpts :: [String] -> IO ([Flag], [String])
compilerOpts argv = do
    name <- getProgName
    case getOpt Permute options argv of
       (o,n,[])   -> if existOut o then return (o,n) else ioError $ userError $ usageInfo header options
        where header = "Usage: "++ name ++" [OPTION...] files..."
       (_,_,errs) -> ioError $ userError $ concat errs ++ usageInfo header options
        where header = "Usage: "++ name ++" [OPTION...] files..."

existOut :: [Flag] -> Bool
existOut [] = False
existOut ((Output _ _):_) = True
existOut (_:t) = existOut t

getInput :: [Flag] -> String
getInput ((Input s):_) = s
getInput (_:t) = getInput t

getOutput :: [Flag] -> (Format,String)
getOutput ((Output f s):_) = (f,s)
getOutput (_:t) = getOutput t
