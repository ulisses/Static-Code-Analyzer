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

getContestsName :: Disk Data -> [String]
getContestsName (Folder a l) = al l

al :: [Disk Data] -> [String]
al [] = []
al ((Folder fn _):t) =  name fn : al t

