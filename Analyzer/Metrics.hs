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
                 | Clone [(FileDst, [(Ocurrency, LineSrc, LineDst)])]
                 | Includes ([SystemIncludes],[Includes])
    deriving (Show, Eq, Ord)

type SystemIncludes = String
type Includes = String
type FunctionName = String
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
    where isClone _ (Clone _) = True
          isClone _ _           = False

{-TEST-}
exM = emptyMetrics
    >.> (("metrica1","file","fun1"),Num 1.90)
    >.> (("metrica2","",""),Num 2)
    >.> (("metricaNum2","file","fun1"),Num 1)
    >.> (("metricaNum3","file","fun1"),Num 1)
    >.> (("metricaNum4","file","fun1"),Num 1)
    >.> (("metricaNum5","file","fun1"),Num 1)
    >.> (("metricaNum6","file",""),Num 1.009)

{- Aux functions -}
toMetrics = Metrics
fromMetrics (Metrics m) = m
{- Unpack from Metrics, apply a function 'f' and pack again into Metrics.
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
deleteMetric = unpackPack . M.delete

{- Concat Metrics -}
(>+>) :: Metrics -> Metrics -> Metrics
m1 >+> m2 = concatMetrics m1 m2
    where concatMetrics m1 m2 = toMetrics $ M.union (fromMetrics m1) (fromMetrics m2)

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
splitM :: MetricName -> Metrics -> (Metrics, Metrics)
splitM k m = let (m1,m2) = M.split k $ fromMetrics m
             in (toMetrics m1, toMetrics m2)

{- check if metrics bag is null -}
nullM :: Metrics -> Bool
nullM = M.null . fromMetrics

{- Lookup -}
lookupM :: MetricName -> Metrics -> Maybe MetricValue
lookupM k m = M.lookup k $ fromMetrics m

{- get a value from key (we already know is there) -}
getM :: MetricName -> Metrics -> MetricValue
getM k m =  (fromMetrics m) M.! k

{- Get a list of Metrics and return a Metrics -}
concatMetrics :: [Metrics] -> Metrics
concatMetrics = foldl (>+>) emptyMetrics
