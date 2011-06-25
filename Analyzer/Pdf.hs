module Pdf where

import System.Process

import Latex

{- Convert Metrics to PDF -}
generatePDF out m = do
    let outT = toTex out
    generateLatex outT m
    h <- runCommand ("latexmk -e '$pdflatex=q/pdflatex --shell-escape -synctex=1 %T/' -pdf "++ outT ++" > /dev/null 2> > /dev/null")
    ex <- waitForProcess h
    return()

toTex :: String -> String
toTex "" = ""
toTex ".pdf" = ".tex"
toTex (h:t) = h : toTex t
