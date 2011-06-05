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

module Comments(getNrOfLinesOfComments,commentLinesDensity) where

import Language.C.Comments
import Language.C.Data.InputStream(inputStreamFromString)
import Language.C.Parser
import Language.C.Data.Position(nopos)

import NumberOfLines
import Metrics

commentLinesDensity :: FilePath -> IO Metrics
commentLinesDensity file = do
    mNrCom <- getNrOfLinesOfComments file
    (Just (Num nrCom)) <- return $ lookupM ("getNrOfLinesOfComments",file,"") mNrCom
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
    l <- comments file
    return $ emptyMetrics
             >.> ( ("getNrOfLinesOfComments",file,"")
                 , Num $ sum $ l >>= return . fromIntegral . filterComment
                 )
    where filterComment :: Comment -> Int
          filterComment x | isRealComment x = length $ filter (not . null) $ lines $ commentText x
                          | otherwise       = 0

{- Check if a comment is in fact a real human words command
   or a block of commented code.
-}
isRealComment :: Comment -> Bool
isRealComment c = either (const True) (const False) (parseC (inputStreamFromString $ commentTextWithoutMarks c) nopos)
