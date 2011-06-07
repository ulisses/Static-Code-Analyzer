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
import GHC.IO (unsafePerformIO)
import System.Environment
import Data.Data
import Data.Monoid
import Data.Maybe
import qualified Data.ByteString as BS
import Language.C
import Language.C.System.GCC
import Language.C.Data.Ident
import Language.C.Pretty
import Strafunski.Data.Generics.Strafunski.StrategyLib.ChaseImports
import Strafunski.Data.Generics.Strafunski.StrategyLib.StrategyPrimitives
import Strafunski.Data.Generics.Strafunski.StrategyLib.TraversalTheme
import Strafunski.Data.Generics.Strafunski.StrategyLib.StrategyPrelude
import Strafunski.Data.Generics.Strafunski.StrategyLib.FlowTheme
import Control.Monad
import System.Console.GetOpt
import Data.Maybe ( fromMaybe )
import qualified Control.Monad.Parallel as P

import Comments
import NumberOfLines
import Metrics
import Includes
import NumberOfLines
import Complexity(mccabeIndex)
import Functions
import AbsolutePath
import Files
import Latex
import XML

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
    [ Option ['v'] ["verbose"]    (NoArg Verbose)             "chatty output on stderr"
    , Option ['x'] ["outputXML"]  (OptArg (out XML) "FILE")   "output in XML format to FILE, default: FILE=out.xml"
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

main :: IO ()
main = do
    (dir:_) <- getArgs
    lst <- getListOfCFiles dir >>= return . take 100
    putStrLn "tenho a lista de files"
    l1 <- P.mapM getNrOfLinesOfComments lst
    putStrLn "tenho todas as metricas do mundo"
    l2 <- return $ concatMetrics l1
    putStrLn "tudo numa metrica so, siga PDF"
    generatePDF l2

fromListOfPathsToMatetrics [] m = return m
fromListOfPathsToMatetrics (h:t) mAcc = do
    m <- getNrOfLinesOfComments h
    fromListOfPathsToMatetrics t (m >+> mAcc)

--mapM getNrOfLinesOfComments lst >>= return . foldl (>+>) emptyMetrics >>= geraPDF


unsafeInterleaveMapIO f (x:xs) = unsafeInterleaveIO $ do
    y <- f x
    ys <- unsafeInterleaveMapIO f xs
    return (y : ys)
unsafeInterleaveMapIO _ [] = return []

{- auxiliar function to test -}
parr = parseCFile (newGCC "gcc") Nothing ["-U__BLOCKS__"] "main.c"
parse = parseCFile (newGCC "gcc") Nothing ["-U__BLOCKS__"] 
fromRight = (\(Right prog) -> prog)

{- Count the number of instructions
-}

{- Depth
-}
dep :: IO Int
dep =  parr >>= dep' . fromRight

dep' :: Data a => a -> IO Int
dep' = applyTU (depthWith dep'')

depthWith s = recurse `passTU` -- Sequential composition
    \depth_subterms ->
        let max_subterms | null depth_subterms = 0
                         | otherwise = maximum depth_subterms
        in (ifTU s
                (const (constTU (max_subterms + 1)))
                (constTU max_subterms)
           )
        where
        recurse = allTU (++) [] (depthWith s `passTU` \depth -> constTU [depth])

dep'' = failTU `adhocTU` loop'

--loop' :: CStat -> IO Int
loop' = return . loop_
    where loop_ (CIf _ _ _ _)    = 1
          loop_ (CSwitch _ _ _)  = 1
          loop_ (CWhile _ _ _ _) = 1
          loop_ (CFor _ _ _ _ _) = 1

--mccabe :: IO Int
--mccabe =  parr >>= mccabeIndex . fromRight

--decl (CDecl _ l _) = return . sum [ | () <- l]
