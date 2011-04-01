UNAME := $(shell uname -s)

all:
ifeq ($(UNAME),Darwin)
	latexmk -e '$$pdflatex=q/pdflatex -synctex=1 %T/' -pdf rel.tex
endif
ifeq ($(UNAME),Linux)
	latexmk -pdf rel.tex
endif

clean:
	find . -maxdepth 1 \( \! -iname "*.bib" \! -iname "*\.tex" -type f \! -iname "makefile" \! -iname "*.sty" \) -exec rm '{}' \;
	find . -name *~ -or -name *.*~ | xargs rm
