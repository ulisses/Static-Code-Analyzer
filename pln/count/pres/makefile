all:pres.tex
	pdflatex pres.tex

open:pres.pdf
	open pres.pdf

clean:
	find . -maxdepth 1 \( \! -iname "*\.sty" \! -iname "*\.pl" \! -iname "*\.tex" -type f \! -iname "makefile" \) -exec rm '{}' \;
