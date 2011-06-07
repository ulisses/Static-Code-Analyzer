all:
	make release
release:
	ghc -O -rtsopts -threaded --make Main.hs -o main 
debug:
	ghc -debug -rtsopts -threaded --make Main.hs -o main 
clean:
	rm -f *.*~ *~ *.o *.hi
run:all
	./main gcc-4.6.0 +RTS -N2 -sstderr -qg
