{-#OPTIONS -XScopedTypeVariables#-}
------------------------------------------------------------------------------ 
-- | 
-- Author       : Ulisses Araujo Costa
-- Stability    : experimental
-- Portability  : portable
--
-- This module is part of 'Static-Code-Analyzer', a library to automatic
-- calculate some metrics related with C99 and GNU C extensions code.
--
-- This module implement the getNrOfLinesOfComments function.
-- With this function we are able to get the number of non null lines of
-- comments, we also do not consider a C code commented line as comment.
-- So we only get the real non C code number of commented lines.
-- Here we also implement other metric related with C comments.
--
------------------------------------------------------------------------------

--module Comments(getNrOfLinesOfComments,commentLinesDensity) where
module Comments where

import Language.C.Comments
import Language.C.Data.InputStream(inputStreamFromString)
import Language.C.Parser
import Language.C.Data.Position(nopos)
import qualified System.IO.Strict as S
import qualified Control.Exception as Ex

import NumberOfLines
import Metrics

commentLinesDensity :: FilePath -> IO Metrics
commentLinesDensity file = do
    mNrCom <- getNrOfLinesOfComments file
    (Num nrCom) <- return $ getM ("getNrOfLinesOfComments",file,"") mNrCom
    nrLin  <- ncloc file >>= return . fromIntegral
    return $ emptyMetrics
             >.> ( ("commentLinesDensity",file,"")
                 , Num (( nrCom /  (nrLin + nrCom)) * 100)
                 )

{- Here we get the number of lines of comments for the human language
   writen lines of comments. So we exclude C code, we do not consider
   C code commented.
-}
getNrOfLinesOfComments :: FilePath -> IO Metrics
getNrOfLinesOfComments file = do
    tryToReadStrict file (return . commentsFromString) $
        (\l -> return $ emptyMetrics
                 >.> ( ("getNrOfLinesOfComments",file,"")
                     , Num $ sum $ l >>= return . fromIntegral . filterComment
                     ))
    where filterComment :: Comment -> Int
          filterComment x | isRealComment x = length $ filter (not . null) $ lines $ commentText x
                          | otherwise       = 0

tryToReadStrict :: FilePath -> (String -> IO a) -> (a -> IO Metrics) -> IO Metrics
tryToReadStrict file fun rest = do
    eith <- Ex.try (S.readFile file >>= fun)
    case eith of
        (Left (_::Ex.SomeException)) -> putStrLn ("excepcao no ficheiro "++file) >> return emptyMetrics
        (Right r) -> rest r

{- Check if a comment is in fact a real human words command
   or a block of commented code.
-}
isRealComment :: Comment -> Bool
isRealComment c = either (const True) (const False) (parseC (inputStreamFromString $ commentTextWithoutMarks c) nopos)
