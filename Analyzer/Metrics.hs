{-#OPTIONS -XGADTs -XOverloadedStrings -XNoMonomorphismRestriction#-}
------------------------------------------------------------------------------ 
-- | 
-- Author       : Ulisses Araujo Costa
-- Stability    : experimental
-- Portability  : portable
--
-- This module is part of 'Static-Code-Analyzer', a library to automatic
-- calculate some metrics related with C99 and GNU C extensions code.
--
-- In this module I implement the metrics container and related functions to this
-- container. including exportation to XML
--
------------------------------------------------------------------------------

module Metrics where

import Data.List

import Control.Monad.State
import qualified Data.Map as M
import Data.Maybe
import Text.XML.HXT.Core
import Text.XML.HXT.Arrow.Pickle.Xml
import Text.LaTeX

import System.Process
import Control.Concurrent
import GHC.IO.Handle
import System.Exit

infixl 5 >.>
infixl 4 >+>

{- We will need to use stateT in all the fucntions that generate metrics 
f = execStateT g emptyMetrics

g :: StateT Metrics IO ()
g = do x <- get
       put emptyMetrics
       lift $ putStrLn "vou dizer ola noutra funcao"
       h "ola"
       y <- get
       put $ insertMetric ("nomeMetrica2",Num 2) y

h :: String -> StateT Metrics IO ()
h s = do x <- get
         put $ insertMetric ("nomeMetrica1",Num 1) x
         lift $ putStrLn s
-}
{- types -}
data Metrics = Metrics (M.Map MetricName MetricValue)
    deriving Show
type MetricName = (String,String,String)

data MetricValue = Num Double
                 | Clone FileSrc [(FileDst, [(Ocurrency, LineSrc, LineDst)])]
    deriving (Show, Eq, Ord)

type FileDst = String
type FileSrc = String
type Ocurrency = String
type LineDst = Int
type LineSrc = Int

getAllNum,getAllClone :: Metrics -> Metrics
getAllNum = unpackPack (M.filterWithKey isNum)
    where isNum _ (Num _) = True
          isNum _ _       = False
getAllClone = unpackPack (M.filterWithKey isClone)
    where isClone _ (Clone _ _) = True
          isClone _ _           = False

{- Convert Metrics to LaTeX -}
example m packageName = do
    documentclass [a4paper,oneside] article
    "\\usepackage{verbatim}"
    "\\usepackage[pdftex]{hyperref}"
    title (("Metrics Report" >> footnote disclamer >> "  \\ on package ") >> (textsf $ fromString packageName))
    document $ do
           maketitle
           tableofcontents
           fromNumToLaTeX m
           fromCloneToLaTeX m
    where disclamer = "This was automatically generated by \\href{github.com/ulisses/Static-Code-Analyzer}{Static-Code-Analyzer}."

{- Convert a (Clone _ _) metricvalue to LaTeX -}
fromCloneToLaTeX :: Monad m => Metrics -> LaTeX m
fromCloneToLaTeX = fromCloneToLaTeX' . getAllClone

fromCloneToLaTeX' :: Monad m => Metrics -> LaTeX m
fromCloneToLaTeX' m | nullM  m = noop
                    | otherwise = do section "Clones"
                                     "Found " >> (texString $ sizeM m) >> singularOrPlural
                                     foldrM step noop m
    where singularOrPlural | sizeM m == 1 = " possible cloned file"
                           | otherwise = " possible cloned files"
          step k v r = let fileName = myfromString $ getClonedFile v
                       in  subsection fileName
                               >> myfromString ("This file was possible cloned from "++(texString $ length $ getClonedLst v)++" files:") >> newline
                               >> (foldr stepL noop $ getClonedLst v)
                           >> r
          getClonedFile (Clone f _) = f
          getClonedLst (Clone _ l) = l
          stepL (s,l) r = (textbf $ myfromString s) >> (foldr stepOcorrencies noop l) // r
          stepOcorrencies (o,lsrc,ldst) r = newline
                                                >> fromString ("Found at line " ++ (texString lsrc) ++ " in source file and at line " ++ (texString ldst)
                                                    ++ " in destination file")
                                                >> (verbatim $ fromString o)
                                            >> r

{- Convert a (Num _) metricvalue to LaTeX -}
fromNumToLaTeX :: Monad m => Metrics -> LaTeX m
fromNumToLaTeX = fromNumToLaTeX' . getAllNum

fromNumToLaTeX' :: Monad m => Metrics -> LaTeX m
fromNumToLaTeX' m | nullM m   = noop
                  | otherwise = do section "Nums"
                                   (texString $ sizeM m) >> " metrics analyzed." // newline
                                   foldr (>>) newpage $ intersperse newpage $ map toTabular $ toTabularParts m
    where
    {- This function will break a bag of metrics into a list of bags, each bag has maxPowsPerPage bags.
       This is usefull because LaTeX won't break tables if they don't fit in one page.
    -}
    toTabularParts :: Metrics -> [Metrics]
    toTabularParts m | sizeM m > maxRowsPerPage = let (k,v)   = elemAtM maxRowsPerPage m
                                                      (m1,m2) = splitM k m
                                                  in m1 : toTabularParts m2
                     | otherwise = [m]
        where maxRowsPerPage = 25
    {- This version of toTabular will print a tabular environment, without taking care
       if the elements are too much and the tabular won't fit in just one page.
       So, this we only send to this function parts of our main tabular
    -}
    toTabular :: Monad m => Metrics -> LaTeX m
    toTabular m = tabular ["c"] "|c|c|c|c|" (myhline >> textbf "Metric Name" & textbf "File Name" & textbf "Function Name"
                                                      & textbf "Metric Value" // myhline >> foldrM step noop m)
        where step (k1,k2,k3) v r = fromString k1 & fromString k2 & fromString k3 & (fromNum v) // myhline >> r
              fromNum (Num a) = texString a

myfromString = fromString . fixString
texString = myfromString . show
newline = noop // noop
myhline = "\\hline "
noop = ""

fixString "" = ""
fixString ('_':t) = "\\_" ++ fixString t
fixString (h:t) = h : fixString t

r m = render $ example m "clone"

geraPDF exM = do
    t <- render $ example exM "test"
    (inp,out,err,proc) <- runInteractiveProcess "pdflatex" [] Nothing Nothing
    hPutStr inp t
    hGetContents out >>= print
    exitCode <- waitForProcess proc
    case exitCode of
        ExitSuccess -> do
            (_,_,_,proc) <- runInteractiveProcess "open" ["article.pdf"] Nothing Nothing
            exitCode <- waitForProcess proc
            case exitCode of
                ExitSuccess -> return()
                exitError -> do
                    terminateProcess proc
                    exitWith exitError
        exitError -> do
            terminateProcess proc
            exitWith exitError

{- XML Metrics serialization -}
instance XmlPickler Metrics where
    xpickle 
        = xpWrap ( toMetrics . M.fromList , M.toList . fromMetrics ) $
          xpList $
          xpElem "metric" $ xpPair (xpTriple (xpAttr "name" xpText) (xpAttr "fileName" xpText) (xpAttr "functionName" xpText)) xpickle

instance XmlPickler MetricValue where
    xpickle = xpAlt tag ps
        where
        tag (Num _)     = 0
        tag (Clone _ _) = 1
        ps = [ xpWrap ( Num , \(Num i) -> i )     (xpAddFixedAttr "type" "num" $ xpAttr "value" $ xpWrap (read, show) xpText)
             , xpWrap ( uncurry Clone, \(Clone s sl) -> (s,sl)) $ xpPair (xpAddFixedAttr "type" "clone" $ xpAttr "srcPath" xpText) (xpList xpTuple)
             ]
        xpTuple = xpElem "cloneFile" $ xpPair (xpAttr "dstPath" xpText) xpTrip
        xpTrip = xpList $  xpElem "location" $ xpTriple (xpAttr "srcTxt" xpText) (xpAttr "lineSrc" xpickle) (xpAttr "lineDst" xpickle)

xpMetrics :: PU Metrics
xpMetrics = xpElem "metrics"
	      $ xpAddFixedAttr "packageName" "test"
	      $ xpickle

--storeMetrics :: Metrics -> IO ()
storeMetrics m = do
    runX ( constA m >>> xpickleDocument xpMetrics
           [withIndent yes] "pickle.xml"
         )
    --readFile "pickle.xml" >>= putStrLn
{-TEST-}
exM = emptyMetrics
    >.> (("metrica1","file","fun1"),Num 1.90)
    >.> (("metrica2","",""),Num 2)
    >.> (("metrica3","file","fun1"), c)
    >.> (("metricaNum2","file","fun1"),Num 1)
    >.> (("metricaNum3","file","fun1"),Num 1)
    >.> (("metricaNum4","file","fun1"),Num 1)
    >.> (("metricaNum5","file","fun1"),Num 1)
    >.> (("metricaNum6","file",""),Num 1.009)

c = Clone "main.c" [("../../../../..//1-matricula/1.2/pp2/Aulas/0405/050405.c",[("\\t}",25,44),("\\t}",46,44)]),("../../../../..//1-matricula/1.2/pp2/Aulas/0422/turma.c",[("\\t}",25,126),("\\t}",46,126)]),("../../../../..//1-matricula/1.2/pp2/PP2 TP3/ex1.c",[("\\t}",25,104),("return 0;",37,606),("\\t}",46,104)]),("../../../../..//2-matricula/1.2/pp2/ex/media/win_c2/code/pp2/2-matricula/aulas/6.c",[("\\t\\t}",45,33)]),("../../../../..//2-matricula/1.2/pp2/ex/media/win_c2/code/pp2/2-matricula/pp2_tp1/_tp1/tp1.c",[("return 0;",37,67)]),("../../../../..//2-matricula/1.2/pp2/ex/media/win_c2/code/pp2/2-matricula/pp2_tp3/desenho.c",[("\\t}",25,38),("\\t\\t",44,214),("\\t\\t}",45,37),("\\t}",46,38)]),("../../../../..//2-matricula/1.2/pp2/ex/media/win_c2/code/pp2/2-matricula/pp2_tp3/file.c",[("\\t}",25,41),("\\t\\t",44,55),("\\t\\t}",45,68),("\\t}",46,41)]),("../../../../..//2-matricula/1.2/pp2/ex/media/win_c2/code/pp2/2-matricula/pp2_tp3/id.c",[("\\t}",25,68),("\\t\\t",44,140),("\\t\\t}",45,56),("\\t}",46,68)]),("../../../../..//2-matricula/1.2/pp2/ex/media/win_c2/code/pp2/2-matricula/pp2_tp3/myio.c",[("\\t}",25,59),("\\t\\t",44,50),("\\t\\t}",45,57),("\\t}",46,59)]),("../../../../..//2-matricula/1.2/pp2/ex/media/win_c2/code/pp2/2-matricula/pp2_tp3/prog.c",[("\\t}",25,101),("\\t\\t",44,95),("\\t\\t}",45,123),("\\t}",46,101)])]

{- Aux functions -}
toMetrics = Metrics
fromMetrics (Metrics m) = m
{- Unpack from Metrics, apply a function 'f' and pack
   again into Metrics.
   This is the pointwise version of this function:
-- unpackPack f (Metrics m) = toMetrics $ f $ fromMetrics m
-}
unpackPack f = toMetrics  . f . fromMetrics

emptyMetrics :: Metrics
emptyMetrics = Metrics M.empty

{- Add new metric to metrics bag, or update a metric value
-}
(>.>) :: Metrics -> (MetricName,MetricValue) -> Metrics
m >.> d = insertMetric d m

insertMetric :: (MetricName,MetricValue) -> Metrics -> Metrics
insertMetric (mn,mv) m | M.member mn fm = let (Just mv') = M.lookup mn fm
                                          in if mv' == mv then m else unpackPack ins m
                       | otherwise   = unpackPack ins m
    where fm  = fromMetrics m
          ins = M.insert mn mv

{- Delete Metrics by name -}
deleteMetric :: MetricName -> Metrics -> Metrics
--deleteMetric mn m = unpackPack (delete mn) m
deleteMetric = unpackPack . M.delete

{- Concat Metrics -}
(>+>) :: Metrics -> Metrics -> Metrics
m1 >+> m2 = concatMetrics m1 m2

concatMetrics :: Metrics -> Metrics -> Metrics
concatMetrics m1 m2 = toMetrics $ M.union (fromMetrics m1) (fromMetrics m2)

{- foldr over Metrics -}
foldrM :: (MetricName -> MetricValue -> c -> c) -> c -> Metrics -> c
foldrM f s = M.foldrWithKey f s . fromMetrics

{- get the size of a Metrics -}
sizeM :: Metrics -> Int
sizeM = M.size . fromMetrics

{- get the element at position X -}
elemAtM :: Int -> Metrics -> (MetricName, MetricValue)
elemAtM n = M.elemAt n . fromMetrics

{- split by key -}
--splitM :: Int -> Metrics -> (MetricName, MetricValue)
splitM k m = let (m1,m2) = M.split k $ fromMetrics m
             in (toMetrics m1, toMetrics m2)

{- check if metrics bag is null -}
--splitM :: Int -> Metrics -> (MetricName, MetricValue)
nullM = M.null . fromMetrics

{- Lookup -}
lookupM k m = M.lookup k $ fromMetrics m
