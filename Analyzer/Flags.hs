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

data Flag  = Verbose
           | Help
           | Input String
           | Output Format String
           | LibDir String
    deriving Show

data Format = XML | PDF | LATEX
    deriving Show

options :: [OptDescr Flag]
options =
    [ Option ['x'] ["outputXML"]  (OptArg (out XML) "FILE")   "output in XML format to FILE, default: FILE=out.xml"
    , Option ['p'] ["outputPDF"]  (OptArg (out PDF) "FILE")   "output in PDF format to FILE, default: FILE=out.pdf"
    , Option ['t'] ["outputTEX"]  (OptArg (out LATEX) "FILE") "output in LaTeX format to FILE, default: FILE=out.tex"
    , Option ['i'] ["input"]      (ReqArg Input  "FILE")      "input FILE in XML format"
    , Option []    ["help"]       (NoArg Help)                "prints this help message"
    --, Option ['L'] ["libdir"]     (ReqArg LibDir "DIR") "library directory"
    ]

out :: Format -> Maybe String -> Flag
out XML   = Output XML . fromMaybe "out.xml"
out PDF   = Output PDF . fromMaybe "out.pdf"
out LATEX = Output LATEX . fromMaybe "out.tex"

compilerOpts :: [String] -> IO ([Flag], [String])
compilerOpts argv = do
    name <- getProgName
    case getOpt Permute options argv of
       (o,n,[])   -> return (o,n)
       (_,_,errs) -> ioError $ userError $ concat errs ++ usageInfo header options
        where header = "Usage: "++ name ++" [OPTION...] files..."
