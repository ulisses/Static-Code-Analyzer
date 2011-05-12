module Comments(getNrOfLinesOfComments) where

import Language.C.Comments
import Language.C.Data.InputStream(inputStreamFromString)
import Language.C.Parser
import Language.C.Data.Position(nopos)

{- Here we get the number of lines of comments for the human language
   writen lines of comments. So we exclude C code, we do not consider
   C code commented.
-}
getNrOfLinesOfComments :: FilePath -> IO Int
getNrOfLinesOfComments file = do
    l <- comments file
    return $ sum $ l >>= (\x -> if (isRealComment x) then (return $ length $ lines $ commentText x) else (return 0))

{- Check if a comment is in fact a real human words command
   or a block of commented code.
-}
isRealComment :: Comment -> Bool
isRealComment c = either (const True) (const False) (parseC (inputStreamFromString $ commentTextWithoutMarks c) nopos)
