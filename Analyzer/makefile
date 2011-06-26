all:
	make release
release:
	ghc -O2 -rtsopts -threaded --make Main.hs -o analyzer 
debug:
	ghc --make Main.hs -o main 
clean:
	rm -f *.*~ *~ *.o *.hi test.* out.* *.dot *.tex *.aux *.log output.*
run:all
	./main gcc-4.6.0 +RTS -N2 -sstderr -qg

pdf:
	latexmk -e '$$pdflatex=q/pdflatex --shell-escape -synctex=1 %T/' -pdf test.tex > /dev/null
	open test.pdf
	
