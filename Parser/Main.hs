{-#OPTIONS -XScopedTypeVariables -XNoMonomorphismRestriction -XFlexibleInstances -XUndecidableInstances#-}

module Main where

import IO
import GHC.IO (unsafePerformIO)
import System.Environment
import System.Process
import Data.Data
import Data.Monoid
import Data.Maybe
import qualified Data.ByteString as BS
import Language.C
import Language.C.System.GCC
import Language.C.Data.Ident
import Language.C.Pretty
import Data.Generics.Strafunski.StrategyLib.ChaseImports
import Data.Generics.Strafunski.StrategyLib.StrategyPrimitives
import Data.Generics.Strafunski.StrategyLib.TraversalTheme
import Data.Generics.Strafunski.StrategyLib.StrategyPrelude
import Data.Generics.Strafunski.StrategyLib.FlowTheme
import Control.Monad

{- Try to incorporate on-the-fly tests with C random code generation with CSmith tool.
   But we must have a method in Language.C that receives a Handler or a ByteString.
   Because this is just for test purpose is probably too much work to do.
   If someone is interested in doing this, please read the parceCFile in the
   Language.C.System.GCC and Language.C libraries
-}
{-
funfun :: IO BS.ByteString
funfun = do (_,out,_,pid) <- runInteractiveProcess "csmith" [] Nothing Nothing
            bs <- BS.hGetContents out
            waitForProcess pid
            return bs
--            parseCFileFromCSmith bs
-}

parr = parseCFile (newGCC "gcc") Nothing ["-U__BLOCKS__"] "main.c"
parse = parseCFile (newGCC "gcc") Nothing ["-U__BLOCKS__"] 

fromRight = (\(Right prog) -> prog)

{- mcCabe index, we need to have Int as Monoid, in the future
   we must change this to Sum, because we may want to have
   (*) as a Monoid too.
   Read more here: http://blog.sigfpe.com/2009/01/haskell-monoids-and-their-uses.html
-}
testMcCabe :: IO Int
testMcCabe =  parr >>= mcCabeIndex . fromRight

instance Num a => Monoid a where
    mappend = (+)
    mempty = 0

mcCabeIndex :: Data a => a -> IO Int
mcCabeIndex =  applyTU (full_tdTU isConditional)

isConditional = constTU 0 `adhocTU` (return . test)

test (CIf _ _ _ _) =  1
test (CSwitch _ _ _) =  1
test _ =  0

{- Get the name of all functions names in our C file
-}
getFunctionsName :: IO [String]
getFunctionsName = parr >>= return . getFunName . fromRight

getFunName = filter (not . null) . applyTU (once_tdTU names)

names = constTU [] `adhocTU` test1

test1 (CFunDef _ (CDeclr (Just name ) ((CFunDeclr _ _ _):_) _ _ _ ) _ _ _) = [identToString name]

{- Return the signature for all functions.
   We never repeat functions signature declarations, if the programmer (the person who wrote the C code) had write function signatures
   we will ignore it and only look at full functions specifications.

   To see more clearly you can test with:
       getFunctionsSign >>= putStr . unlines  . map (show . pretty)
-}

getFunctionsSignFromC :: Data x => x -> [x]
getFunctionsSignFromC = getFunSign

getFunctionsSign :: IO [CTranslUnit]
getFunctionsSign = parr >>= return . getFunSign . fromRight

getFunSign :: Data x => x -> [x]
getFunSign = applyTP (topdown names1)
    where names1 = idTP `adhocTP` (return . fromFunctionToSign)

fromFunctionToSign (CFDefExt (CFunDef lCDeclSpec cDeclr _ _ _ )) = CDeclExt (CDecl lCDeclSpec [(Just $ cDeclr,Nothing,Nothing)] internalNode)

{- testtttting -}
-- Java metrics via instantiation of generic metrics
--nestingDepth :: Term t => t -> Int
nestingDepth =  applyTU (depthWith )
-- Generic algorithm for depth of nesting

depthWith = recurse `passTU` -- Sequential composition
    \depth_subterms ->
        let max_subterms = maximum (0:depth_subterms)
        in (ifTU isConditional2
            (const (constTU (max_subterms + 1)))
            (constTU max_subterms))
            where recurse = allTU (++) [] (depthWith `passTU` \depth -> constTU [depth])

isConditional2 = constTU 0 `adhocTU` testt `adhocTU` testtt

testt (CIf _ _ _ _) =  putStrLn "encontrei um if" >> return 1
testt (CSwitch _ _ _) =  putStrLn "encontrei um switch" >> return 1
testt _ =  return 0

testtt (CFDefExt (CFunDef _ (CDeclr (Just (Ident "main" _ _ )) _ _ _ _) _ _ _ ))
    = putStrLn "encontrei uma main fun" >> return 1
testtt _ = return 0

--getFunMcCabe fun1 (CFDefExt (CFunDef _ (CDeclr (Just (Ident fun2 _ _ )) _ _ _ _) _ _ _ ))
--    | fun1 == fun2 = 

-- lets find main function






{- We may need to import some libraries to be able to put the input code
   to work, so we must say it to GCC like this:
   stream <- parseCFile (newGCC "gcc") Nothing ["-Idir"] file
   where 'dir' is the directory where our code is.
   This flag is passed as it is directly to GCC, so is just an common import.
-}
process :: String -> IO ()
process file = do
    {- This version of Language.C does not support BLOCKS notation from MacOSX,
       so we need to undefine them... It is not pretty, but is a fast solution to get our code being parsed
    -}
    stream <- parseCFile (newGCC "gcc") Nothing ["-U__BLOCKS__"] file
    case stream of
        ( Left error  ) -> print error
        ( Right cprog ) -> (putStr . unlines  . map (show . pretty) . getFunctionsSignFromC) cprog

main :: IO ()
main = do
    files <- getArgs
    mapM_ process files

