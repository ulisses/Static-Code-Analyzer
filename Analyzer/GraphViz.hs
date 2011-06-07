------------------------------------------------------------------------------ 
-- | 
-- Author       : Ulisses Araujo Costa
-- Stability    : experimental
-- Portability  : portable
--
-- This module is part of 'Static-Code-Analyzer', a library to automatic
-- calculate some metrics related with C99 and GNU C extensions code.
--
-- In this module I implement the exporter to graphviz
--
------------------------------------------------------------------------------
module GraphViz(generateGraphViz) where

import System.Path.NameManip
import Data.GraphViz.Types
import Data.GraphViz

import Metrics
import Includes
import Files

{-Graphviz-}
generateGraphViz dir = do
    lst <- getListOfCFiles dir
    m <- mapM getIncludes lst >>= return . foldr (>+>) emptyMetrics
    writeDotToFile "out.dot" $ createDotGraph $ foldrM fromMetricsToDotEdge [] m

    where createDotGraph :: [DotEdge String] -> DotGraph String
          createDotGraph edjs = DotGraph {strictGraph = False, directedGraph = True, graphID = Just (Str "G"), graphStatements = DotStmts {attrStmts = [GraphAttrs {attrs = [FontSize 45.0,Ratio FillRatio,Center True,FontName "Courier"]},NodeAttrs {attrs = [Shape Circle,Color [X11Color Gray],Style [SItem Rounded []],Width 1.0e-2,Height 1.0e-2,Skew 0.0,Style [SItem Filled []],FontName "Courier"]},EdgeAttrs {attrs = [Color [X11Color Black],FontName "Courier"]}], subGraphs = [], nodeStmts = [], edgeStmts = edjs}}
          
          writeDotToFile file grp = prettyPrint grp >>= writeFile file

fromMetricsToDotEdge :: MetricName -> MetricValue -> [DotEdge String] -> [DotEdge String]
fromMetricsToDotEdge (_,file,_) (Includes (lsys,linc)) l = let (_,f) = split_path file
                                                           in keyToDot ((lsys,linc),f) ++ l
    where keyToDot :: (([SystemIncludes], [Includes]), String) -> [DotEdge String]
          keyToDot ((lsys,linc),path) = f lsys path ++ f linc path

          f :: [String] -> String -> [DotEdge String]
          f l path = foldl (\t h -> ed path h : t) [] l
          ed from to = DotEdge {edgeFromNodeID = from, edgeToNodeID = to, directedEdge = True, edgeAttributes = []}
