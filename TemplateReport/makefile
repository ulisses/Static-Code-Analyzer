all:
	pdflatex Relatorio.tex
clean:
	find . -maxdepth 1 \( \! -iname "*\.tex" -type f \! -iname "makefile" \! -iname "*.sty" \) -exec rm '{}' \;
	find . -name *~ -or -name *.*~ | xargs rm
