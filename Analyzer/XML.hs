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
            where fromL = M.fromList . foldr step []
                  step ((a,b,c),d) t = ((a, if null b then Nothing else Just b, if null c then Nothing else Just c),d) : t
                  toL   = foldr (\((a,b,c),d) t ->  ((a, maybe "" id b, maybe "" id c),d) :t ) [] . M.toList

instance XmlPickler MetricValue where
    xpickle = xpAlt tag ps
        where
        tag (Num _)     = 0
        tag (Clone _) = 1
        tag (Includes _) = 2
        tag (Graphviz _) = 3
        tag (GraphvizProject _) = 4
        ps = [ xpWrap ( Num , \(Num i) -> i )     (xpAddFixedAttr "type" "num" $ xpAttr "value" $ xpWrap (read, show) xpText)
             , xpWrap ( Clone . M.fromList, M.toList . \(Clone sl) -> sl) $ (xpList xpTuple)
             , xpWrap ( Includes , \(Includes t) -> t) $ xpTupleIncludes
             , xpWrap ( Graphviz , \(Graphviz df) -> df) $ xpDotFile
             , xpWrap ( GraphvizProject , \(GraphvizProject df) -> df) $ xpDotFileProject
             ] --  xpPair (xpAddFixedAttr "type" "clone" $ xpAttr "srcPath" xpText)
        xpTuple = xpElem "cloneFile" $ xpPair (xpAttr "dstPath" xpText) xpTrip
        xpTrip = xpList $  xpElem "location" $ xpTriple (xpAttr "srcTxt" xpText) (xpAttr "lineSrc" xpickle) (xpAttr "lineDst" xpickle)
        xpTupleIncludes = xpPair xpListSystemIncludes xpListIncludes
        xpListSystemIncludes = xpElem "systemIncludes" $ xpList inc
        xpListIncludes = xpElem "includes" $ xpList inc
        inc = xpElem "value" $ xpText
        xpDotFile = xpElem "graphvizCode" xpText
        xpDotFileProject = xpElem "graphvizProject" xpText

test =  generateXML "out.xml" "NAME" (emptyMetrics >.> (("includes",Nothing,Nothing),Includes (["sysA","sysB"],["A","B"])) 
            >.> (("graphviz", Just "FILE",Nothing),Graphviz "GGGGGG\naaaa")
          )

xpMetrics :: String -> PU Metrics
xpMetrics name =
            xpElem "metrics"
	      $ xpAddFixedAttr "packageName" name
	      $ xpickle

generateXML :: String -> String -> Metrics -> IO ()
generateXML file name m = do
    _ <- runX ( constA m >>> xpickleDocument (xpMetrics name)
               [withIndent yes] file
              )
    return ()
