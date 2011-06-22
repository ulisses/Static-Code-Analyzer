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
type Metrics = M.Map MetricName MetricValue
type MetricName = (String, Maybe FileSrc,Maybe FunctionName)
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

showMetrics :: Metrics -> String
showMetrics = M.foldrWithKey (\k v t -> show k ++ "   ->   " ++ show v ++ "\n" ++ t) []

getAllNum,getAllClone :: Metrics -> Metrics
getAllNum = M.filterWithKey isNum
    where isNum _ (Num _) = True
          isNum _ _       = False
getAllClone = M.filterWithKey isClone
    where isClone _ (Clone []) = False -- an empty clone is not a clone
          isClone _ (Clone _)  = True
          isClone _ _          = False

{-TEST-}
exM = emptyMetrics
    >.> (("metrica1",Just "file", Just "fun1"),Num 1.90)
    >.> (("metrica2",Nothing,Nothing),Num 2)
    >.> (("metricaNum2", Just "file",Just "fun1"),Num 1)
    >.> (("metricaNum3",Just "file",Just "fun1"),Num 1)
    >.> (("metricaNum4",Just "file",Just "fun1"),Num 1)
    >.> (("metricaNum5",Just "file",Just "fun1"),Num 1)
    >.> (("metricaNum6",Just "file", Nothing),Num 1.009)

emptyMetrics :: Metrics
emptyMetrics = M.empty

{- Add new metric to metrics bag, or update a metric value
-}
(>.>) :: Metrics -> (MetricName,MetricValue) -> Metrics
m >.> d = insertMetric d m

insertMetric :: (MetricName,MetricValue) -> Metrics -> Metrics
insertMetric (mn,mv) m =
    case M.lookup mn m of
        Nothing    -> ins m
        (Just mv') -> if mv' == mv then m else ins m
    where ins = M.insert mn mv

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
