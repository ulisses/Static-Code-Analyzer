module Main where

import Data.Data
import Language.C
import Language.C.System.GCC
import Language.C.Data.Ident
import System.Environment
import Mpi

data C a = C (Either () (a,[a]))
	deriving Show

--newtype Out a c = Out { out :: c a -> Either () (a,c a) }

--newtype Out a c = Out {out :: a c -> Either c (c , Out a c) }

newtype Out a b c = Out { out :: Either b (b, Out a b c) }

--BTree a -> Either () (a,(BTree a,BTree a))

--fun :: (Num t, Data t) => C [a]
--fun = gfoldl fpass fterm [1,2,3]

-- a -> c a
fterm :: a -> C a
fterm a = C $ Left ()

fpass = undefined
-- fpass :: c (a -> b) -> a -> c b
--fpass :: C (d -> b) -> d -> C b
--fpass (C (Left ())) d = C 

cata g = g . (rec (cata g)) . out
rec f = id -|- (id >< f)

process :: String -> IO ()
process file = do
	--stream <- readInputStream file
	--stream <- parseCFile (newGCC "gcc") Nothing ["-I../../../../../2-matricula/1.2/pp2/ex/media/win_c2/code/pp2/2-matricula/pp2_tp3/"] file
	stream <- parseCFile (newGCC "gcc") Nothing ["-U__BLOCKS__"] file
--	putStr (take (20 - length file) $ repeat ' ')
	case stream of
		( Left error  ) -> print error
		--( Right cprog ) -> f cprog
		( Right cprog ) -> print cprog

f :: CTranslUnit -> IO()
f (CTranslUnit l n) = mapM_ g l

g :: CExtDecl -> IO()
--g (CDeclExt cdecl)   = 
g (CFDefExt fx) = h fx
--g (CAsmExt CStrLit)  = 

h :: CFunDef -> IO()
h (CFunDef lDeclSpec cDeclr lDecl cs n) = do
	mapM_ i lDeclSpec
	ii cDeclr
	mapM_ ll lDecl
	statement cs

statement :: CStat -> IO()
statement (CReturn (Just cExpr) ni) = do
	putStr "return "
	expr cExpr
statement (CReturn Nothing ni)          = putStrLn "RETURNS"
statement (CLabel ident cStat lCAttr _) = putStrLn "LABEL"
statement (CCompound lIdent lCBlockItem _) = do
	mapM_ (putStrLn . identToString) lIdent
	mapM_ block lCBlockItem

block :: CBlockItem -> IO()
block (CBlockStmt cStat) = statement cStat

ii :: CDeclr -> IO()
ii (CDeclr Nothing lCDerivedDeclr (Just cStrLit) lcAtrb _) = putStrLn "N J"
ii (CDeclr (Just ident) lCDerivedDeclr Nothing lcAtrb _)   = do
	
	let funName = identToString ident
	putStr funName
	mapM_ jj lCDerivedDeclr
	mapM_ kk lcAtrb

kk :: CAttr -> IO()
kk (CAttr ident lCExpr n) = putStrLn $ identToString ident 

jj :: CDerivedDeclr -> IO()
--jj (CPtrDeclr lCTypeQual nodeInfo)                    = 
--jj (CArrDeclr lCTypeQual cArrSize nodeInfo)           = 
jj (CFunDeclr (Right (lCDecl, bool)) lCAttr nodeInfo) = do
	mapM_ ll lCDecl
	mapM_ kk lCAttr
jj (CFunDeclr (Left lIdent) lCAttr nodeInfo)          = do
	mapM_ (putStrLn . identToString) lIdent
	mapM_ kk lCAttr

ll :: CDecl -> IO()
ll (CDecl lCDeclSpec l ni) = do
	mapM_ i lCDeclSpec
	mm l

mm :: [(Maybe CDeclr, Maybe CInit, Maybe CExpr)] -> IO()
mm l = mapM_ nn l

nn :: (Maybe CDeclr, Maybe CInit, Maybe CExpr) -> IO()
nn (a,b,c) = do
	oo a
	pp b
	qq c

oo :: Maybe CDeclr -> IO()
oo Nothing = return ()
oo (Just c) = ii c

pp :: Maybe CInit -> IO()
pp Nothing = return ()
pp (Just c) = aaa c

qq :: Maybe CExpr -> IO()
qq Nothing = return ()
qq (Just e) = expr e

aaa :: CInit -> IO()
aaa (CInitExpr cExpr _)     = putStrLn "cexpr"
aaa (CInitList cInitList _) = putStrLn "cinitList"

expr :: CExpr -> IO()
expr (CComma lCExpr _) = mapM_ expr lCExpr
expr (CConst cConst)   = constt cConst

constt :: CConst -> IO()
constt (CIntConst cInteger _)     = putStrLn $  show $ getCInteger cInteger
constt (CCharConst cChar _)       = putStrLn $ getCChar cChar
constt (CFloatConst (CFloat f) _) = putStrLn $ show f
constt (CStrConst cString _)      = putStrLn $ getCString cString

i :: CDeclSpec -> IO()
i (CTypeSpec ctype) = typeSpec ctype

typeSpec :: CTypeSpec -> IO()
typeSpec (CVoidType _) = putStr "void "
typeSpec (CIntType _)  = putStr "int "

main :: IO ()
main = do
	files <- getArgs
	mapM_ process files

