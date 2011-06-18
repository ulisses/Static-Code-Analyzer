------------------------------------------------------------------------------ 
-- | 
-- Author       : Ulisses Araujo Costa
-- Stability    : experimental
-- Portability  : portable
--
-- This module is part of 'Static-Code-Analyzer', a library to automatic
-- calculate some metrics related with C99 and GNU C extensions code.
--
-- This module have some metrics related with functions
--
------------------------------------------------------------------------------
module Functions where

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

nofunName = "NOFUN"

{- Get the name of all functions names in our C file
-}
getFunsName :: Data a => a -> IO [String]
getFunsName = return . filter (not . null) . applyTU (once_tdTU names)
    where names = constTU [] `adhocTU` test1
          test1 (CFDefExt (CFunDef _ (CDeclr (Just name ) ((CFunDeclr _ _ _):_) _ _ _ ) _ _ _)) = [identToString name]
          --test1 (CDeclExt (CDecl _ (((Just ((CDeclr (Just name ) ((CFunDeclr _ _ _):_) _ _ _ ))),_,_):_) _)) = [identToString name]
          test1 _ = [nofunName]

{- Return the signature for all functions.
   We never repeat functions signature declarations, if the programmer (the person who wrote the C code) had write function signatures
   we will ignore it and only look at full functions specifications.

   To see more clearly you can test with:
       getFunctionsSign >>= putStr . unlines  . map (show . pretty)
-}
getFunSign :: Data x => x -> [x]
getFunSign = applyTP (topdown names1)
    where names1 = idTP `adhocTP` (return . fromFunctionToSign)
          fromFunctionToSign (CFDefExt (CFunDef lCDeclSpec cDeclr _ _ _ )) = CDeclExt (CDecl lCDeclSpec [(Just $ cDeclr,Nothing,Nothing)] internalNode)
