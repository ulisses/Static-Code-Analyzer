{-#OPTIONS -XFlexibleInstances -XUndecidableInstances#-}
------------------------------------------------------------------------------ 
-- | 
-- Author       : Ulisses Araujo Costa
-- Stability    : experimental
-- Portability  : portable
--
-- This module is part of 'Static-Code-Analyzer', a library to automatic
-- calculate some metrics related with C99 and GNU C extensions code.
--
-- In this module I implement the metrics related with complexity
--
------------------------------------------------------------------------------
module Complexity where

import Data.Data
import Data.Monoid
import Language.C
import Language.C.System.GCC
import Language.C.Data.Ident
import Data.Generics.Strafunski.StrategyLib.ChaseImports
import Data.Generics.Strafunski.StrategyLib.StrategyPrimitives
import Data.Generics.Strafunski.StrategyLib.TraversalTheme
import Data.Generics.Strafunski.StrategyLib.StrategyPrelude
import Data.Generics.Strafunski.StrategyLib.FlowTheme

import Functions

instance Num a => Monoid a where
    mappend = (+)
    mempty = 0

p = parseCFile (newGCC "gcc") Nothing ["-U__BLOCKS__"] "main.c"
r= (\(Right r) -> r)

{- mccabe index per function, for all function inside a C file
-}
mccabePerFun :: CTranslUnit -> IO [(String,Int)]
mccabePerFun d = do
    funs <- getFunsName d
    mccabes <- (mapM mccabeIndex . getListFunFromC )d
    return $ zip funs mccabes
    where getListFunFromC (CTranslUnit l _) = l

{- mcCabe index, we need to have Int as Monoid, in the future
   we must change this to Sum, because we may want to have
   (*) as a Monoid too.
   Read more here: http://blog.sigfpe.com/2009/01/haskell-monoids-and-their-uses.html
-}
mccabeIndex :: Data a => a -> IO Int
mccabeIndex = applyTU (full_tdTU typesOfInstr)

typesOfInstr = constTU 0
	`adhocTU` loop
	`adhocTU` binaryOp

loop :: CStat -> IO Int
loop = return . loop_
    where loop_ (CIf _ _ _ _)    = 1
          loop_ (CSwitch _ _ _)  = 1
          loop_ (CWhile _ _ _ _) = 1
          loop_ (CFor _ _ _ _ _) = 1
          loop_ _                = 0

binaryOp :: CBinaryOp -> IO Int
binaryOp = return . binaryOp_
    where
    binaryOp_ CLndOp = 1
    binaryOp_ CLorOp  = 1
    binaryOp_ _      = 0
