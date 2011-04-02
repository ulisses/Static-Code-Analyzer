#
# This makefile belongs to Static-Code-Analyzer project.
#

CAT=$(shell cat .gitignore)

clean:
	`for f in $(CAT) ; do find . -iname $$f | xargs rm -f ; done`

#
# To install you need to execute with 'sudo'.
#

install:
	bash scripts_install/install.sh
