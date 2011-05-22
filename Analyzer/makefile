all:
	make release
release:
	ghc -O2 -threaded --make Main.hs -o main 
profile:
	ghc -O2 -threaded --make Main.hs -o main -prof -auto-all
run:
	./main main.c 
run_profile:
	./main +RTS -K100M -p -hc
clean:
	rm -f *.*~ *~ *.o *.hi

