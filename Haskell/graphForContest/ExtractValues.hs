module ExtractValues where

import ProcessDirectory( scan, Disk(..), Data(..))

{-
    Here we have: (x,y,r)
    where 'x' and 'y' are the coordinates and 'r' the radius
    of the circular spot
    -}
vals = [(1,2,1),(1,5,1),(1,8,1)]

fog = scan "/Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/sample_app/data/concursos"

