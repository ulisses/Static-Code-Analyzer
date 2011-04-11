module ProcessDirectory(
	scan,
	Disk(..),
	Data(..)
)
where

import System.Directory ( doesFileExist, getDirectoryContents, getModificationTime , getHomeDirectory)
import System.IO as IO ( openBinaryFile , hFileSize , hClose , IOMode(..) , openFile)
import System.IO.Error as Error (try , ioeGetFileName , ioeGetErrorType)
import System.Time
import Mpi
import System.IO.Unsafe
import System.IO.Error
import Data.Maybe ( fromMaybe )
import Data.List as L (elemIndices)

--filterDotDir = filter (/= ".") . filter (/= "..")
--getDContents = getDirectoryContents "/Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/sample_app/data/concursos" >>= return . filterDotDir

data Disk a = File a
             | Folder    a [Disk a]
             deriving (Eq , Ord , Read)

instance Functor Disk where
    fmap f = catadisco $ indisco . recdisco f id

instance Show a => Show (Disk a) where
    show = showDisk

-- | Converts a 'Disk' a to a 'String'.
--
-- Na integra o que estava na biblioteca "Data.Tree"
showDisk :: Show a => Disk a -> String
{-# SPECIALIZE INLINE showDisk :: Disk Data   -> String #-}
{-# SPECIALIZE INLINE showDisk :: Disk String -> String #-}
{-# SPECIALIZE INLINE showDisk :: Disk Int -> String #-}
{-# SPECIALIZE INLINE showDisk :: Disk (String,Int) -> String #-}
showDisk  = unlines . drawDisk . fmap show
    where
    drawDisk :: Disk String -> [String]
    drawDisk (File a) = [a]
    drawDisk (Folder p ts0) = grp this (space (Prelude.length this)) (stLoop ts0)
        where
        this          = s1 ++ p ++ " "
        space n       = replicate n ' '
        stLoop []     = [""]
        stLoop [t]    = grp s2 "  " (drawDisk t)
        stLoop (t:ts) = grp s3 s4 (drawDisk t) ++ [s4] ++ rsLoop ts
        rsLoop []     = error "rsLoop:Unexpected empty list."
        rsLoop [t]    = grp s5 "  " (drawDisk t)
        rsLoop (t:ts) = grp s6 s4 (drawDisk t) ++ [s4] ++ rsLoop ts
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


--
-- | Is the responsable for find files recursively in any
-- valid directory @d@ and assemble the information in data
-- 'Disk' 'Data', our type...
--
scan :: FilePath -> IO (Disk Data)
scan f = scan_ f >>= return . fmap (fromMaybe DataNull)

scan_ :: FilePath -> IO (Disk (Maybe Data))
scan_ s = do
    exist <- doesFileExist s
    case exist of
        True  -> (getInfoFile s $ Left()) >>= return . File
        False -> do
            info      <- getInfoFile s $ Right()
            teste_try <- Error.try $ getDirectoryContentsDiskCatalog (s++"/")
            case teste_try of
                Left err       -> getClockTime >>= \_ -> reportError err >>  (return $ Folder info [])
                Right contents -> do
                    case contents of
                        [] -> return $ Folder info []
                        l  -> mapM scan_ l >>= \rest -> return $ Folder info rest


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
-- material para o tipo @Disk a@
----------------------------------------------------------------------
catadisco :: (Either a (a,[c]) -> c) -> Disk a -> c
{-# SPECIALIZE INLINE catadisco :: (Either Data (Data,[Disk Data]) -> Disk Data) -> Disk Data -> Disk Data #-}
catadisco f = f . recdisco id (catadisco f) . outdisco

anadisco :: (a -> Either a (a,[a])) -> a -> Disk a
anadisco h = indisco . (recdisco id (anadisco h)) . h

hylodisco :: (Either a (a,[c]) -> c ) -> (a ->  Either a (a,[a])) -> a -> c
hylodisco f g = catadisco f . anadisco g

recdisco :: (a -> b) -> (c -> d) -> Either a (a,[c]) -> Either b (b,[d])
recdisco f g = f -|- f >< map g

outdisco :: Disk a -> Either a (a,[Disk a])
{-# SPECIALIZE INLINE outdisco :: Disk Data -> Either Data (Data,[Disk Data]) #-}
outdisco (File a) = i1 a
outdisco (Folder a l)  = i2 (a,l)

indisco :: Either a (a,[Disk a]) -> Disk a
{-# SPECIALIZE INLINE indisco :: Either Data (Data,[Disk Data]) -> Disk Data #-}
indisco = either File (uncurry Folder)

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
                ['Disk' a] ---------------> 1 + ['Char'] * ['Char']
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

