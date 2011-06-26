USE
===

	analyzer -i <dir> [-x<file.xml> | -p<file.pdf> | -t<file.tex>]

where dir is the directory you want to extract metrics from. And [-x,-p,-t] is the output type of file you want.

DEPENDENCIES
============

Please read in the wikipage the procedures to install the Haskell libraries.
After that hit

	make

and then

	sudo make install
	
in this folder, after that you will have a new command: analyzer

