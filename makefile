#
# This makefile belongs to Static-Code-Analyzer project.
#

CAT=$(shell cat .gitignore)

clean:
	`for f in $(CAT) ; do find . -iname $$f | xargs rm -f ; done`

#
# To install you need to execute with 'sudo'.
#
install_macosx:
	port install gd2
	cpan -fi GD GD::Graph GD::Graph::bars GD::Graph::pie Path::Class
	cpan -fi Makefile::Parser Parser::Yapp

install_linux:
	aptitude install libgd-dev
	cpan -fi GD GD::Graph GD::Graph::bars GD::Graph::pie Path::Class
	cpan -fi Makefile::Parser Parser::Yapp
