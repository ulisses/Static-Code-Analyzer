{-#OPTIONS -XFlexibleInstances#-}

module ExtractValues where

import Data.List

import ProcessDirectory

{-
    Here we have: (x,y,r)
    where 'x' and 'y' are the coordinates and 'r' the radius
    of the circular spot
    -}
vals = [(1,2,1),(1,5,1),(1,8,1)]

fog = scan "/Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/sample_app/data/concursos"

{-
getNameContests :: Disk Data -> [String]
getNameContests (File _) = []
getNameContests (Folder a l) | intersect (name a) "contest-" == "contest-" = name a : concat ( map getNameContests l)
                             | otherwise = concat $ map getNameContests l
-}
-- example : /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/sample_app/data/concursos/contest-1/en-1/user-1/tent-20110303163050


--con1 :: Disk Data -> [(Int,Int,Int)]
--con1 (Folder a l) = 

type ContestName = String

getContestsName :: IO [ContestName]
getContestsName = fog >>= return . getContestsName_
    where
    getContestsName_ :: Disk Data -> [ContestName]
    getContestsName_ (Folder a l) = getNamesFolders l

type AssignmentName = String

getAssignmentName :: ContestName -> IO [AssignmentName]
getAssignmentName c = fog >>= return . (getAssignmentName_ c)
    where
    getAssignmentName_ :: ContestName -> Disk Data -> [AssignmentName]
    getAssignmentName_ c (Folder a l) | name a == c = getNamesFolders l
                                      | otherwise   = concat (fmap (getAssignmentName_ c) l)

type GroupName = String

--getGroupName :: ContestName -> AssignmentName -> IO [GroupName]
--getGroupName c assig = fog >>= return . (getGroupName_ c assig)
--getGroupName_ :: ContestName -> AssignmentName -> Disk Data -> [GroupName]
--getGroupName_ c as (Folder a l) |


getNamesFolders :: [Disk Data] -> [String]
getNamesFolders [] = []
getNamesFolders ((Folder fn _):t) =  name fn : getNamesFolders t

