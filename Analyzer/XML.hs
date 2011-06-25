{-#OPTIONS -XTypeSynonymInstances#-}
------------------------------------------------------------------------------ 
-- | 
-- Author       : Ulisses Araujo Costa
-- Stability    : experimental
-- Portability  : portable
--
-- This module is part of 'Static-Code-Analyzer', a library to automatic
-- calculate some metrics related with C99 and GNU C extensions code.
--
-- In this module I implement the latex exporter
--
------------------------------------------------------------------------------
module XML where

import Text.XML.HXT.Core
import Text.XML.HXT.Arrow.Pickle.Xml
import qualified Data.Map as M
import Data.Maybe
import qualified Data.Map as M

import Metrics

instance XmlPickler Metrics where
    xpickle =
          xpWrap ( fromL , toL ) $
          xpList $
          xpElem "metric" $ xpPair (xpTriple
                                       (xpAttr "name" xpText)
                                       (xpAttr "fileName" xpText)
                                       (xpAttr "functionName" xpText)
                                   )
                                   xpickle
            where fromL = M.fromList . foldr (\((a,b,c),d) t ->  ((a, if null b then Nothing else Just b, if null c then Nothing else Just c),d) :t ) []
                  toL   = foldr (\((a,b,c),d) t ->  ((a, maybe "" id b, maybe "" id c),d) :t ) [] . M.toList

instance XmlPickler MetricValue where
    xpickle = xpAlt tag ps
        where
        tag (Num _)     = 0
        tag (Clone _) = 1
        ps = [ xpWrap ( Num , \(Num i) -> i )     (xpAddFixedAttr "type" "num" $ xpAttr "value" $ xpWrap (read, show) xpText)
             , xpWrap ( Clone . M.fromList, M.toList . \(Clone sl) -> sl) $ (xpList xpTuple)
             ] --  xpPair (xpAddFixedAttr "type" "clone" $ xpAttr "srcPath" xpText)
        xpTuple = xpElem "cloneFile" $ xpPair (xpAttr "dstPath" xpText) xpTrip
        xpTrip = xpList $  xpElem "location" $ xpTriple (xpAttr "srcTxt" xpText) (xpAttr "lineSrc" xpickle) (xpAttr "lineDst" xpickle)

xpMetrics :: PU Metrics
xpMetrics = xpElem "metrics"
	      $ xpAddFixedAttr "packageName" "test"
	      $ xpickle

generateXML :: String -> Metrics -> IO ()
generateXML file m = do
    _ <- runX ( constA m >>> xpickleDocument xpMetrics
               [withIndent yes] file
              )
    return ()
