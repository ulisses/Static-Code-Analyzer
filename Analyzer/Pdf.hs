------------------------------------------------------------------------------ 
-- | 
-- Author       : Ulisses Araujo Costa
-- Stability    : experimental
-- Portability  : portable
--
-- This module is part of 'Static-Code-Analyzer', a library to automatic
-- calculate some metrics related with C99 and GNU C extensions code.
--
-- In this module I implement the pdf exporter
--
------------------------------------------------------------------------------
module Pdf where

import System.Process

import Latex

{- Convert Metrics to PDF -}
generatePDF out name m = do
    let outT = toTex out
    generateLatex outT name m
    h <- runCommand ("latexmk -e '$pdflatex=q/pdflatex --shell-escape -synctex=1 %T/' -pdf "++ outT ++" > /dev/null 2> /dev/null")
    ex <- waitForProcess h
    return()

toTex :: String -> String
toTex "" = ""
toTex ".pdf" = ".tex"
toTex (h:t) = h : toTex t
