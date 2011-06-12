UNAME := $(shell uname -s)
PRESTEX := pres.tex
PRESPDF := pres.pdf

$(PRESPDF):*.tex
ifeq ($(UNAME),Darwin)
	latexmk -e '$$pdflatex=q/pdflatex -synctex=1 %T/' -pdf $(PRESTEX)
endif
ifeq ($(UNAME),Linux)
	latexmk -pdf $(PRESTEX)
endif

open:pres.pdf
ifeq ($(UNAME),Darwin)
	open $(PRESPDF)
endif
ifeq ($(UNAME),Linux)
	xpdf $(PRESPDF)
endif

clean:
	find . -maxdepth 1 \( \! -iname "*\.sty" \! -iname "*\.tex" -type f \! -iname "makefile" \) -exec rm '{}' \;

