#!/bin/bash
#
# Script to build Static-Code-Analyzer
#

function build_language_c {
	cd Parser/language-c-0.3.2.1/
	runhaskell Setup.hs configure
	runhaskell Setup.hs build
	cd -
}

build_language_c

