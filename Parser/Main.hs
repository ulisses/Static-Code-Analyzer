module Main where

import Language.C
import System.Environment

process :: String -> IO ()
process file = do
	putStr file
	stream <- readInputStream file
	putStr (take (20 - length file) $ repeat ' ')
	either print (const $ putStrLn "Pass") (parseC stream nopos)

main :: IO ()
main = do
	files <- getArgs
	mapM_ process files

