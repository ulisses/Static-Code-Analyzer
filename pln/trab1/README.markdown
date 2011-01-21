USE
===
perl count.pl -open \<dirPath\> [-verbose] [-separated | -allTogether] [-percent] [-bars | -pie] -out \<fileNamePrefix\>

DEPENDENCIES
============
We need to have GD installed, so if you are in MacOSX and you use DarwinPorts you should do:
    sudo port install gd2
    sudo cpan -fi GD::Graph GD::Graph::bars GD::Graph::pie

If you use linux you shoul do:
    sudo aptitude install libgd-dev
    sudo cpan -fi GD::Graph GD::Graph::bars GD::Graph::pie

OPTIONS
=======
    -open <dirPath>       - This flag is required, ditPath should be the directory you want to analyze your code
    -verbose              - Show the languages the program is analyzing
    -separated            - Generates separated images (this is the default)
    -allTogether          - Generates one image with all the analysis
    -percent              - Generates the image with percentage of code analyzed (this is used by default when -allTogether is set).
                            By default this flag is set to 0.
                            If you use -percent with -separated this script will produce 3 files, the ratio file will not be in percentage
    -pie                  - This fag will generate all the images in a pie chart
    -bars                 - This fag will generate all the images in a bars chart (this is the default)
    -out <fileNamePrefix> - This flag is mandatory, and fileNamePrefix is the prefix to be places before each filename image produced

EXAMPLES
========

To get the project image, regarding the project in dir <dir>
    perl count.pl -open <dir> -verbose -out <prefix> -all

To get 3 separated images, regarding the project in dir <dir>
    perl count.pl -open <dir> -verbose -out <prefix>

To get 3 separated images and the values in percentage, regarding the project in dir <dir>
    perl count.pl -open <dir> -verbose -out <prefix> -percent
