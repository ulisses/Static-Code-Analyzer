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

import Control.Monad.State
import qualified Data.Map as M
import Data.Maybe
import Text.XML.HXT.Core
import Text.XML.HXT.Arrow.Pickle.Xml
import Text.LaTeX

import System.Process
import GHC.IO.Handle
import System.Exit

infixl 5 >.>
infixl 4 >+>

{- We will need to use stateT in all the fucntions that generate metrics -}
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

{- types -}
data Metrics = Metrics (M.Map MetricName MetricValue)
    deriving Show
type MetricName = String

data MetricValue = Num Double
                 | Clone String [(String, [(String, Int, Int)])]
    deriving (Show, Eq, Ord)

getAllNum :: Metrics -> Metrics
getAllNum = unpackPack (M.filterWithKey isNum)
    where isNum _ (Num _) = True
          isNum _ _       = False

getAllClone :: Metrics -> Metrics
getAllClone = unpackPack (M.filterWithKey isClone)
    where isClone _ (Clone _ _) = True
          isClone _ _           = False

{- LaTeX -}
example = do
    documentclass [a4paper,twoside] article
    author "Daniel Diaz"
    title "Example"
    document $ do
           maketitle
           tableofcontents
           section "Nums"
           fromNumToLaTeX exM >> newpage
           section "Clones"

fromNumToLaTeX :: Monad m => Metrics -> LaTeX m
fromNumToLaTeX m = let nums = getAllNum m
                   in tabular ["c"] "|c|c|" (hline >> textbf "Metric Name" & textbf "Metric Value" // hline >> toTabular nums >> hline)

toTabular :: Monad m => Metrics -> LaTeX m
toTabular (Metrics m) = M.foldrWithKey step "" m

step :: Monad m => String -> MetricValue -> LaTeX m -> LaTeX m
step k v r = fromString k & (fromNum v) // r
    where fromNum (Num a) = fromString $ show a

geraPDF :: IO()
geraPDF = do
    t <- render example
    writeFile "file.tex" t
    (_,_,_,proc) <- runInteractiveProcess "pdflatex" ["file.tex"] Nothing Nothing
    waitForProcess proc
    (_,_,_,proc) <- runInteractiveProcess "pdflatex" ["file.tex"] Nothing Nothing
    waitForProcess proc
    (_,_,_,proc) <- runInteractiveProcess "pdflatex" ["file.tex"] Nothing Nothing
    exitCode <- waitForProcess proc
    case exitCode of
        ExitSuccess -> do
            (_,_,_,proc) <- runInteractiveProcess "open" ["file.pdf"] Nothing Nothing
            return()
        exitError -> do
            terminateProcess proc
            exitWith exitError

{- XML Metrics serialization -}
instance XmlPickler Metrics where
    xpickle 
        = xpWrap ( toMetrics . M.fromList , M.toList . fromMetrics ) $
          xpList $
          xpElem "metric" $ xpPair (xpAttr "name" xpText) xpickle

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
	      $ xpAddFixedAttr "packageName" "package"
	      $ xpickle

exM = emptyMetrics >.> ("metrica1",Num 1.90)  >.> ("metrica2",Num 2)
    >.> ("metrica3", Clone "FILE2" [("ex1",[("ex2",11,123),("ex22222",1,2)]),("ex44",[("ex3",1222,1)])])
    >.> ("metricaNum2",Num 1)
    >.> ("metricaNum3",Num 1)
    >.> ("metricaNum4",Num 1)
    >.> ("metricaNum5",Num 1)
    >.> ("metricaNum6",Num 1.009)

--storeMetrics :: Metrics -> IO ()
storeMetrics m = do
    runX ( constA m >>> xpickleDocument xpMetrics
           [withIndent yes] "pickle.xml"
         )
    --readFile "pickle.xml" >>= putStrLn

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

deleteMetric :: MetricName -> Metrics -> Metrics
--deleteMetric mn m = unpackPack (delete mn) m
deleteMetric = unpackPack . M.delete

(>+>) :: Metrics -> Metrics -> Metrics
m1 >+> m2 = concatMetrics m1 m2

concatMetrics :: Metrics -> Metrics -> Metrics
concatMetrics m1 m2 = toMetrics $ M.union (fromMetrics m1) (fromMetrics m2)
