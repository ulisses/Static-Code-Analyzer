{-# OPTIONS -XNoMonomorphismRestriction #-}

-- example folder: /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/sample_app/data/concursos/contest-1/en-1/user-1/tent-20110303163050/

module Main where

import Graphics.Rendering.Chart
import Graphics.Rendering.Chart.Gtk
import Graphics.Rendering.Chart.Plot
import Data.Colour
import Data.Colour.Names
import Data.Accessor
import System.Random
import System.Environment(getArgs)
import ExtractValues

main = getArgs >>= ren

ren _ = renderableToPNGFile (toRenderable l) 800 600 "out.png"

l = layout1_title ^="Price History"
    $ layout1_background ^= solidFillStyle (opaque white)
    $ layout1_left_axis ^: laxis_override ^= axisTicksHide
    $ layout1_plots ^= [ Left (toPlot f) ]
    $ setLayout1Foreground (opaque black)
    $ defaultLayout1

f = area_spots_4d_title ^= "random value"
    $ area_spots_4d_max_radius ^= 20
    $ area_spots_4d_values  ^= values
    $ defaultAreaSpots4D

values = [ (d, v, z, t) | ((d,v,z),t) <- zip vals colours ]
    where colours :: [Int]
          colours = [1..]

