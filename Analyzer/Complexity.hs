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
module Complexity(mccabePerFun) where

import Data.Data
import Data.Monoid
import Language.C
import Language.C.System.GCC
import Language.C.Data.Ident
import Strafunski.Data.Generics.Strafunski.StrategyLib.ChaseImports
import Strafunski.Data.Generics.Strafunski.StrategyLib.StrategyPrimitives
import Strafunski.Data.Generics.Strafunski.StrategyLib.TraversalTheme
import Strafunski.Data.Generics.Strafunski.StrategyLib.StrategyPrelude
import Strafunski.Data.Generics.Strafunski.StrategyLib.FlowTheme

import Functions
import Metrics

instance Num a => Monoid a where
    mappend = (+)
    mempty = 0

{- fucntions names that are inside the range of complexities
functionForMccabeIndex :: CTranslUnit -> (Int,Int) -> IO [(String,Int)]
functionForMccabeIndex d (min,max) = do
    l <- mccabePerFun d
    return $ filter (\(_,val) -> val >= min && val <= max) l
-}
{- mccabe index per function, for all function inside a C file
-}
mccabePerFun :: (FilePath,CTranslUnit) -> IO Metrics
mccabePerFun (file,d) = do
    funs <- getFunsName d
    mccabes <- (mapM mccabeIndex . getListFunFromC) d
    let lst = filter ((/=nofunName) . fst) $ zip funs mccabes
    return $ foldl fromFunMccabeToMetrics emptyMetrics lst
    where getListFunFromC (CTranslUnit l _) = l
          fromFunMccabeToMetrics r (funName,mccabeVal) = r >.> (("mccabePerFun",Just file,Just funName), Num $ fromIntegral mccabeVal)

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


{- Depth
-}
dep :: IO Int
dep =  parr >>= dep' . fromRight

dep' :: Data a => a -> IO Int
dep' = applyTU (depthWith dep'')

depthWith s = recurse `passTU` -- Sequential composition
    \depth_subterms ->
        let max_subterms | null depth_subterms = 0
                         | otherwise = maximum depth_subterms
        in (ifTU s
                (const (constTU (max_subterms + 1)))
                (constTU max_subterms)
           )
        where
        recurse = allTU (++) [] (depthWith s `passTU` \depth -> constTU [depth])

dep'' = failTU `adhocTU` loop'

--loop' :: CStat -> IO Int
loop' = return . loop_
    where loop_ (CIf _ _ _ _)    = 1
          loop_ (CSwitch _ _ _)  = 1
          loop_ (CWhile _ _ _ _) = 1
          loop_ (CFor _ _ _ _ _) = 1

parr = parseCFile (newGCC "gcc") Nothing ["-U__BLOCKS__"] "main.c"
fromRight = (\(Right prog) -> prog)
