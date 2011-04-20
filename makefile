#
# This makefile belongs to Static-Code-Analyzer project.
#

CAT=$(shell cat .gitignore)

# this clean will search for all the names (entries) in the .gitignore file and exclude them.
# So in the end you will have just the files under the git repo
dangerous_clean:
	@echo "Cleaning the shop..."
	`for f in $(CAT) ; do find . -iname $$f | xargs rm -f ; done`

#
# To install you need to execute with 'sudo'.
#

install:
	bash scripts_install/install.sh
