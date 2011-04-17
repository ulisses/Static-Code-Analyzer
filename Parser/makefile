all:
	ghc --make Main.hs -o main
run:
	./main main.c 
clean:
	rm -f *.*~ *~ *.o *.hi


# we need to add this to the main script on the root folder
install:
	cd language-c-0.3.2.1
	runhaskell Setup.hs configure
	runhaskell Setup.hs build
	sudo runhaskell Setup.hs install

