module ExtractValues where

import System.Directory ( doesFileExist, getDirectoryContents, getModificationTime , getHomeDirectory)
import System.IO as IO ( openBinaryFile , hFileSize , hClose , IOMode(..) , openFile)
import System.IO.Error as Error (try , ioeGetFileName , ioeGetErrorType)
import System.Time
import Mpi
import System.IO.Unsafe
import System.IO.Error
import Data.List as L (elemIndices)

{-
    Here we have: (x,y,r)
    where 'x' and 'y' are the coordinates and 'r' the radius
    of the circular spot
    -}
vals = [(1,2,1),(1,5,1),(1,8,1)]

filterDotDir = filter (/= ".") . filter (/= "..")

getDContents = getDirectoryContents "/Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/sample_app/data/concursos" >>= return . filterDotDir

data Disco a = Ficheiro a
             | Pasta    a [Disco a]
             deriving (Eq , Ord , Read)

instance Functor Disco where
    fmap f = catadisco $ indisco . recdisco f id

instance Show a => Show (Disco a) where
    show = showDisco

-- | Converts a 'Disco' a to a 'String'.
--
-- Na integra o que estava na biblioteca "Data.Tree"
showDisco :: Show a => Disco a -> String
{-# SPECIALIZE INLINE showDisco :: Disco Data   -> String #-}
{-# SPECIALIZE INLINE showDisco :: Disco String -> String #-}
{-# SPECIALIZE INLINE showDisco :: Disco Int -> String #-}
{-# SPECIALIZE INLINE showDisco :: Disco (String,Int) -> String #-}
showDisco  = unlines . drawDisco . fmap show
    where
    drawDisco :: Disco String -> [String]
    drawDisco (Ficheiro a) = [a]
    drawDisco (Pasta p ts0) = grp this (space (Prelude.length this)) (stLoop ts0)
        where
        this          = s1 ++ p ++ " "
        space n       = replicate n ' '
        stLoop []     = [""]
        stLoop [t]    = grp s2 "  " (drawDisco t)
        stLoop (t:ts) = grp s3 s4 (drawDisco t) ++ [s4] ++ rsLoop ts
        rsLoop []     = error "rsLoop:Unexpected empty list."
        rsLoop [t]    = grp s5 "  " (drawDisco t)
        rsLoop (t:ts) = grp s6 s4 (drawDisco t) ++ [s4] ++ rsLoop ts
        grp fst0 rst  = zipWith (++) (fst0:repeat rst)
        [s1,s2,s3,s4,s5,s6] = ["- ", "--", "-+", " |", " `", " +"]

type DataSec = Int

data Data = Data { name         :: String
                 , size         :: Integer
                 , creationTime :: DataSec
                 , tipo         :: String
                 }
          | DataNull
          deriving (Eq , Ord , Show , Read)


getIntTime :: ClockTime -> DataSec
getIntTime fileTime = tdSec $ diffClockTimes fileTime $ TOD 0 0

putTime :: DataSec -> ClockTime
putTime fileClockTime = TOD (toInteger fileClockTime) 0

scan :: FilePath -> IO (Disco (Maybe Data))
scan s = do
    exist <- doesFileExist s
    case exist of
        True  -> (getInfoFile s $ Left()) >>= return . Ficheiro
        False -> do
            info      <- getInfoFile s $ Right()
            teste_try <- Error.try $ getDirectoryContentsDiskCatalog (s++"/")
            case teste_try of
                Left err       -> getClockTime >>= \_ -> reportError err >>  (return $ Pasta info [])
                Right contents -> do
                    case contents of
                        [] -> return $ Pasta info []
                        l  -> mapM scan l >>= \rest -> return $ Pasta info rest


--
-- | Get directory contents and drop the '..' and '.' dir's.
--
-- * /getDirectoryContentsDiskCatalog/ in 'do' notation:
--
-- > getDirectoryContentsDiskCatalog s =
-- >    do l <- getDirectoryContents s
-- >       return $ (drop 2) $ map (s++) l
--
getDirectoryContentsDiskCatalog :: FilePath -> IO [FilePath]
getDirectoryContentsDiskCatalog f = getDirectoryContents f >>= return . (Prelude.drop 2) . Prelude.map (f++)

----------------------------------------------------------------------
-- material para o tipo @Disco a@
----------------------------------------------------------------------
catadisco :: (Either a (a,[c]) -> c) -> Disco a -> c
{-# SPECIALIZE INLINE catadisco :: (Either Data (Data,[Disco Data]) -> Disco Data) -> Disco Data -> Disco Data #-}
catadisco f = f . recdisco id (catadisco f) . outdisco

anadisco :: (a -> Either a (a,[a])) -> a -> Disco a
anadisco h = indisco . (recdisco id (anadisco h)) . h

hylodisco :: (Either a (a,[c]) -> c ) -> (a ->  Either a (a,[a])) -> a -> c
hylodisco f g = catadisco f . anadisco g

recdisco :: (a -> b) -> (c -> d) -> Either a (a,[c]) -> Either b (b,[d])
recdisco f g = f -|- f >< map g

outdisco :: Disco a -> Either a (a,[Disco a])
{-# SPECIALIZE INLINE outdisco :: Disco Data -> Either Data (Data,[Disco Data]) #-}
outdisco (Ficheiro a) = i1 a
outdisco (Pasta a l)  = i2 (a,l)

indisco :: Either a (a,[Disco a]) -> Disco a
{-# SPECIALIZE INLINE indisco :: Either Data (Data,[Disco Data]) -> Disco Data #-}
indisco = either Ficheiro (uncurry Pasta)

type FileName = String
----------------------------------------------------------------------
-- material para listas
----------------------------------------------------------------------

catalist :: (Either () (a,c) -> c) -> [a] -> c
catalist g   = g . reclist (catalist g) . outlist

analist :: (a -> Either b (c,a)) -> a -> [c]
analist h = inlist . reclist (analist h) . h

hylolist :: (Either () (c,c) -> c) -> (a -> Either b (c,a)) -> a -> c
hylolist f g = catalist f . analist g

reclist :: (c -> d) -> Either a (b,c) -> Either a (b,d)
reclist g = id -|- id >< g

outlist :: [a] -> Either () (a,[a])
outlist []    = i1 ()
outlist (a:x) = i2(a,x)

inlist :: Either a (b,[b]) -> [b]
inlist = either (const []) (uncurry (:))

{-|
Get the file name from a path.
* Dyagram of function 'fileName', in a anamorphism:
@                               genAna_s
                ['Disco' a] ---------------> 1 + ['Char'] * ['Char']
                   |                              |
                   |                              |
'analist' genAna_s |                              | id '-|-' id '><' 'analist' genAna_s
                   |                              |
                   V                              V
              [['Char']] <------------------- 1 + ['Char'] * [['Char']]
                            'inlist' (matrix)
@
> where genAna_s is the auxiliar function of the anamorphism.
-}
fileName :: FilePath -- ^ 'FilePath' of the file
    -> FileName -- ^ Return just the name of the file
fileName = tail . last . analist genAna
    where genAna = cond Prelude.null (Left . (!)) (cond (elem '/') (Right . Mpi.split id tail) (Left . (!)))

--
-- | Assemble some file information into 'Data'.
--
getInfoFile :: FilePath -- ^ 'FilePath' of file
    -> Either () ()     -- ^ 'Left'() if 'FilePath' variable points to a file or 'Right'() if it's a directory
    -> IO (Maybe Data)  -- ^ return 'Nothing' if accours an error (report it to log.err file) see: 'reportError'
getInfoFile f e = do
    let newFileName = fileName f
    case e of
        Left()  -> do
            teste_try <- Error.try $ openBinaryFile f ReadMode
            case teste_try of
                Left err      -> do reportError err ; return Nothing
                Right handle  -> do
                    teste_try_size <- Error.try $ hFileSize handle
                    case teste_try_size of
                        Left err -> do reportError err ; return Nothing
                        Right size -> do
                            teste_try' <- Error.try $ getModificationTime f
                            case teste_try' of
                                Left err -> do reportError err ; return Nothing
                                Right time' -> do
                                    let time = getIntTime time'
                                    hClose handle
                                    return $ Just $ Data newFileName size time (tipe f)
        Right() -> do
            teste_try' <- Error.try $ getModificationTime f
            case teste_try' of
                Left err    -> do reportError err ; return Nothing
                Right time' -> (return $ getIntTime time') >>= \time -> return $ Just $ Data newFileName 0 time ""

database , errorFile :: FilePath
database  = (unsafePerformIO getHomeDirectory) ++ "/.cd/.dados"
errorFile = (unsafePerformIO getHomeDirectory) ++ "/.cd/info.log"

--
-- | Report an error into file log.err.
--
reportError :: IOError -> IO ()
reportError err = do
    time_file <- getClockTime
    let tipo          = ioeGetErrorType err
    let (Just file)   = ioeGetFileName err
    appendFile errorFile ((logError (tipo,file) $ show time_file) ++ "\n")
    where
    logError :: (IOErrorType , String) -> String -> String
    logError (tipo,file) time =
        case tipo of
            alreadyExistsErrorType -> "(EE) " ++ time ++ ": erro no ficheiro " ++ file ++ ": ja existe"
            doesNotExistErrorType -> "(EE) " ++ time ++ ": erro no ficheiro " ++ file ++ ": ficheiro nao existe"
            alreadyInUseErrorType -> "(EE) " ++ time ++ ": erro no ficheiro " ++ file ++ ": resource ocupado"
            fullErrorType -> "(EE) " ++ time ++ ": erro no ficheiro " ++ file ++ ": resource exausted"
            eofErrorType -> "(EE) " ++ time ++ ": erro no ficheiro " ++ file ++ ": end of file"
            illegalOperationErrorType -> "(EE) " ++ time ++ ": erro no ficheiro " ++ file ++ ": operacao ilegal"
            permissionErrorType -> "(EE) " ++ time ++ ": erro no ficheiro " ++ file ++ ": permissao negada"
            userErrorType -> "(EE) " ++ time ++ ": erro no ficheiro " ++ file ++ ": erro de utilizador"


-- | Um atalho para /following/ declaration
-- and it continues until the next non-comment line
type Type = String


--
-- | Get the type of a file.
--
-- *Examples:
--
-- > |--------------------|
-- > | filename  | result |
-- > +--------------------+
-- > | abc.def   | def    |
-- > | abc.de.fg | fg     |
-- > | abc.def.g | g      |
--
tipe :: FilePath -> Type
tipe s =
    let elems = elemIndices '.' s
    in case elems of
        [] -> []
        _  -> drop ((last $ elems)+1) s

