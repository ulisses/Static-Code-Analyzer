{-#OPTIONS -XScopedTypeVariables -XNoMonomorphismRestriction -XFlexibleInstances -XUndecidableInstances#-}

module Main where

import GHC.IO (unsafePerformIO)
import System.Environment
import Data.Data
import Data.Monoid
import Data.Maybe
import Language.C
import Language.C.System.GCC
import Language.C.Data.Ident
import Data.Generics.Strafunski.StrategyLib.ChaseImports
import Data.Generics.Strafunski.StrategyLib.StrategyPrimitives
import Data.Generics.Strafunski.StrategyLib.TraversalTheme
import Data.Generics.Strafunski.StrategyLib.StrategyPrelude
import Data.Generics.Strafunski.StrategyLib.FlowTheme
import Control.Monad

parr = parseCFile (newGCC "gcc") Nothing ["-U__BLOCKS__"] "main.c"


{- mcCabe index, we need to have Int as Monoid, in the future
   we must change this to Sum, because we may want to have
   (*) as a Monoid too.
   Read more here: http://blog.sigfpe.com/2009/01/haskell-monoids-and-their-uses.html
-}
testMcCabe :: IO Int
testMcCabe =  parseCFile (newGCC "gcc") Nothing ["-U__BLOCKS__"] "main.c"
                   >>= (\(Right prog) -> ( mcCabeIndex prog))

instance Num a => Monoid a where
	mappend = (+)
	mempty = 0

mcCabeIndex :: Data a => a -> IO Int
mcCabeIndex =  applyTU (full_tdTU isConditional)

isConditional = constTU 0
                          `adhocTU` test

test (CIf _ _ _ _) = return 1
test (CSwitch _ _ _) = return 1
test _ = return 0

{- We may need to import some libraries to be able to put the input code
   to work, so we must say it to GCC like this:
   stream <- parseCFile (newGCC "gcc") Nothing ["-Idir"] file
   where 'dir' is the directory where our code is.
   This flag is passed as it is directly to GCC, so is just an common import.
-}
process :: String -> IO ()
process file = do
	{- This version of Language.C does not support BLOCKS notation from MacOSX,
	   so we need to undefine them... Is a fast solution to get our code being parsed
	-}
	stream <- parseCFile (newGCC "gcc") Nothing ["-U__BLOCKS__"] file
	case stream of
		( Left error  ) -> print error
		--( Right cprog ) -> f cprog

main :: IO ()
main = do
	files <- getArgs
	mapM_ process files

