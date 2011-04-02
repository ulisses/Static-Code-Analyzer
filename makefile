#
# This makefile belongs to Static-Code-Analyzer project.
#

CAT=$(shell cat .gitignore)

clean:
	`for f in $(CAT) ; do find . -iname $$f | xargs rm -f ; done`

#
# To install you need to execute with 'sudo'.
#
UNAME := $(shell uname -s)

install:install_makefile_yapp_pl install_gd_pl
ifeq ($(UNAME),Darwin)
	port install gd2
endif
ifeq ($(UNAME),Linux)
	aptitude install libgd-dev
endif

install_makefile_yapp_pl:
	cpan -fi Makefile::Parser Parser::Yapp

install_gd_pl:
	cpan -fi GD GD::Graph GD::Graph::bars GD::Graph::pie Path::Class

