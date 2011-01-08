USE
===
perl count.pl -open <dirPath> [-verbose] [-separated] [-allTogether] [-percent] -out <fileNamePrefix>

DEPENDENCIES
============
We need to have GD installed, so if you are in MacOSX and you use DarwinPorts you should do:
	sudo port install gd2

If you use linux you shoul do:
	sudo aptitude install libgd-dev


OPTIONS
=======
    -open <dirPath>       - This flag is required, ditPath should be the directory you want to analyze your code
    -verbose              - Show the languages the program is analyzing
    -separated            - Generates separated images (this is the default)
    -allTogether          - Generates one image with all the analysis
    -percent              - Generates the image with percentage of code analyzed (this is used by default when -allTogether is set otherwise no)
    -out <fileNamePrefix> - This flag is mandatory, and fileNamePrefix is the prefix to be places before each filename image produced
