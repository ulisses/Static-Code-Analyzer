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

import Text.XML.HXT.DOM.XmlNode
import Text.XML.HXT.DOM.MimeTypes
import Text.XML.HXT.DOM.ShowXml
import Text.XML.HXT.DOM.TypeDefs
import Text.XML.HXT.Parser.XmlParsec
import Data.Map

data Metrics = Metrics (Map MetricName MetricValue)
type MetricName = String
type MetricValue = Double

{- This function converts a metrics bag to XML
-}
convertToXML :: Metrics -> XmlTrees
convertToXML (Metrics m) = [mkTree (XTag (mkName "metricx") [])  $ convertToXML_]
    where convertToXML_ = foldrWithKey (\k a b -> mkEntry (k, show a) : b) [] m
          mkEntry (k,a) = mkMetricTag [mkNameMetric k, mkValue a]
          mkMetricTag lst = mkTree (XTag (mkName "metric") lst) []
          mkValue v       = (mkAttr (mkName "value")) [(mkTree (mkText v) [])]
          mkNameMetric k  = (mkAttr (mkName "name")) [(mkTree (mkText k) [])]

test :: Metrics
test = Metrics ( fromList([("John",34.0), ("Bob",12.1)]) )
