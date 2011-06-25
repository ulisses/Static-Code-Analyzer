{-#OPTIONS -XExistentialQuantification -XGenerics#-}
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

import Control.Monad.Loops
import qualified Data.Map as M
import qualified Control.Monad.Parallel as P
import Data.Maybe

import System.Process
import Control.Concurrent
import GHC.IO.Handle
import System.Exit

infixl 5 >.>
infixl 4 >+>

{- types -}
type Metrics = M.Map MetricName MetricValue
type MetricName = (String, Maybe FileSrc,Maybe FunctionName)

data MetricValue = Num Double
                 | Clone (M.Map FileDst [(Ocurrency, LineSrc, LineDst)])
                 | Includes ([SystemIncludes],[Includes])
                 | FunSig [FunSignature]
                 | Graphviz DotFile
    deriving (Show, Eq, Ord)

type SystemIncludes = String
type Includes = String
type DotFile = String
type FunSignature = String
type FunctionName = String
type FileDst = String
type FileSrc = String
type Ocurrency = String
type LineDst = Int
type LineSrc = Int

showMetrics :: Metrics -> String
showMetrics = M.foldrWithKey (\k v t -> show k ++ "   ->   " ++ show v ++ "\n" ++ t) []


getAllGraphviz,getAllFunSig,getAllNum,getAllClone :: Metrics -> Metrics

getAllGraphviz = M.filterWithKey isGraphviz
    where isGraphviz _ (Graphviz _) = True
          isGraphviz _ _ = False

getAllFunSig = M.filterWithKey isFunSig
    where isFunSig _ (FunSig []) = False
          isFunSig _ (FunSig _ ) = True
          isFunSig _ _ = False

getAllNum = M.filterWithKey isNum
    where isNum _ (Num _) = True
          isNum _ _       = False

getAllClone = M.filterWithKey isClone
    where isClone _ (Clone m) | M.null m = False -- an empty clone is not a clone
                              | otherwise = True
          isClone _ _          = False

getMetrics :: [IO Metrics] -> IO Metrics
getMetrics [] = return emptyMetrics
getMetrics (h:t) = h >>= \a -> getMetrics t >>= \b -> return $ a >+> b

getMetricsFrom :: (a -> IO Metrics) -> [a] -> IO Metrics
getMetricsFrom f l = forkMapM f l >>= return . concatMetrics . map (either (const emptyMetrics) id)

{- The empty metrics bag -}
emptyMetrics :: Metrics
emptyMetrics = M.empty

{- Add new metric to metrics bag, or update a metric value
-}
(>.>) :: Metrics -> (MetricName,MetricValue) -> Metrics
m >.> d = insertMetric d m

insertMetric :: (MetricName,MetricValue) -> Metrics -> Metrics
insertMetric (mn,mv) m =
    case M.lookup mn m of
        Nothing    -> m'
        (Just mv') -> if mv' == mv then m else m'
    where m' = M.insert mn mv m

{- Delete Metrics by name -}
deleteMetric :: MetricName -> Metrics -> Metrics
deleteMetric = M.delete

{- Concat Metrics -}
(>+>) :: Metrics -> Metrics -> Metrics
m1 >+> m2 = M.union m1 m2

{- foldr over Metrics -}
foldrM :: (MetricName -> MetricValue -> c -> c) -> c -> Metrics -> c
foldrM f s = M.foldrWithKey f s

{- get the size of a Metrics -}
sizeM :: Metrics -> Int
sizeM = M.size

{- get the element at position X -}
elemAtM :: Int -> Metrics -> (MetricName, MetricValue)
elemAtM n = M.elemAt n

{- split by key -}
splitM :: MetricName -> Metrics -> (Metrics, Metrics)
splitM = M.split

{- check if metrics bag is null -}
nullM :: Metrics -> Bool
nullM = M.null

{- Lookup -}
lookupM :: MetricName -> Metrics -> Maybe MetricValue
lookupM k m = M.lookup k m

{- get a value from key (we already know is there) -}
getM :: MetricName -> Metrics -> MetricValue
getM k m =  m M.! k

{- Get a list of Metrics and return a Metrics -}
concatMetrics :: [Metrics] -> Metrics
concatMetrics = foldl (>+>) emptyMetrics
