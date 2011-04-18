UNAME := $(shell uname -s)
RELTEX := Relatorio.tex
RELPDF := Relatorio.pdf

$(RELPDF):*.tex *.bib
ifeq ($(UNAME),Darwin)
	latexmk -e '$$pdflatex=q/pdflatex -synctex=1 %T/' -pdf $(RELTEX)
endif
ifeq ($(UNAME),Linux)
	latexmk -pdf $(RELTEX)
endif

open:$(RELPDF)
ifeq ($(UNAME),Darwin)
	open $(RELPDF)
endif
ifeq ($(UNAME),Linux)
	xpdf $(RELPDF)
endif

clean:
	find . -maxdepth 1 \( \! -iname "*.bib" \! -iname "*\.tex" -type f \! -iname "makefile" \! -iname "*.sty" \) -exec rm '{}' \;
	find . -name *~ -or -name *.*~ | xargs rm
