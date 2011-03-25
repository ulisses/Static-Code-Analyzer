USE
===
perl count.pl -open \<dirPath\> [-verbose] [-separated | -allTogether] [-percent] [-bars | -pie] -out \<fileNamePrefix\> [-path <path_to_save>]

DEPENDENCIES
============
We need to have GD installed, so if you are in MacOSX and you use DarwinPorts you should do:
    sudo port install gd2
    sudo cpan -fi GD::Graph GD::Graph::bars GD::Graph::pie Path::Class

If you use linux you shoul do:
    sudo aptitude install libgd-dev
    sudo cpan -fi GD::Graph GD::Graph::bars GD::Graph::pie Path::Class

OPTIONS
=======
    -open <dirPath>       - This flag is required, ditPath should be the directory you want to analyze your code
    -verbose              - Show the languages the program is analyzing
    -separated            - Generates 3 separated images (this is the default)
    -allTogether          - Generates one image with all the analysis
    -percent              - Generates the image with percentage of code analyzed (this is used by default when -allTogether is set).
                            By default this flag is set to 0.
                            If you use -percent with -separated this script will produce 3 files, the ratio file will not be in percentage
    -pie                  - This fag will generate all the images in a pie chart
    -bars                 - This fag will generate all the images in a bars chart (this is the default)
    -out <fileNamePrefix> - This flag is mandatory, and fileNamePrefix is the prefix to be places before each filename image produced
	-path <path_to_save>  - This is an optional flag. With this you can save the output (the images) to the folder path_to_save

EXAMPLES
========

To get the project image, regarding the project in dir <dir>
    perl count.pl -open <dir> -verbose -out <prefix> -all

To get 3 separated images, regarding the project in dir <dir>
    perl count.pl -open <dir> -verbose -out <prefix>

To get 3 separated images and the values in percentage, regarding the project in dir <dir>
    perl count.pl -open <dir> -verbose -out <prefix> -percent

To get 3 separated images and the values in percentage, regarding the project in dir <dir> and save this to path path_to_save
    perl count.pl -open <dir> -verbose -out <prefix> -percent -path path_to_save
