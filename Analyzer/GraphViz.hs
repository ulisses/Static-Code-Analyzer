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
module GraphViz(generateGraphVizFromFile, generateGraphVizFromProject) where

import System.Path.NameManip
import Data.GraphViz.Types
import Data.GraphViz
import Data.Maybe

import Metrics
import Includes
import Files

{-Graphviz-}
generateGraphVizFromFile :: FilePath -> IO Metrics
generateGraphVizFromFile f = do
    dot <- getIncludes f >>= prettyPrint . createDotGraph . foldrM fromMetricsToDotEdge []
    return $ emptyMetrics >.> (("generateGraphVizFromFile",Just f, Nothing), Graphviz dot)

generateGraphVizFromProject :: [FilePath] -> IO Metrics
generateGraphVizFromProject lst = do
    dot <- mapM getIncludes lst >>= return . concatMetrics
             >>= prettyPrint . createDotGraph . foldrM fromMetricsToDotEdge []
    return $ emptyMetrics >.> (("generateGraphVizFromProject",Nothing, Nothing), GraphvizProject dot)

createDotGraph :: [DotEdge String] -> DotGraph String
createDotGraph edjs = DotGraph {strictGraph = False, directedGraph = True, graphID = Just (Str "G"), graphStatements = DotStmts {attrStmts = [GraphAttrs {attrs = [FontSize 45.0,Ratio FillRatio,Center True,FontName "Courier"]},NodeAttrs {attrs = [Shape Circle,Color [X11Color Gray],Style [SItem Rounded []],Width 1.0e-2,Height 1.0e-2,Skew 0.0,Style [SItem Filled []],FontName "Courier"]},EdgeAttrs {attrs = [Color [X11Color Black],FontName "Courier"]}], subGraphs = [], nodeStmts = [], edgeStmts = edjs}}

fromMetricsToDotEdge :: MetricName -> MetricValue -> [DotEdge String] -> [DotEdge String]
fromMetricsToDotEdge (_,file,_) (Includes (lsys,linc)) l = let (_,f) = split_path $ maybe "" id file
                                                           in keyToDot ((lsys,linc),f) ++ l
    where keyToDot :: (([SystemIncludes], [Includes]), String) -> [DotEdge String]
          keyToDot ((lsys,linc),path) = f lsys path ++ f linc path

          f :: [String] -> String -> [DotEdge String]
          f l path = foldl (\t h -> ed path h : t) [] l
          ed from to = DotEdge {edgeFromNodeID = from, edgeToNodeID = to, directedEdge = True, edgeAttributes = []}

writeDotToFile file grp = prettyPrint grp >>= writeFile file

--generateGraphVizToFile = --    writeDotToFile "out.dot" $ createDotGraph $ foldrM fromMetricsToDotEdge [] m
