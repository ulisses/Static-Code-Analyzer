all:
	rm -f *.png
	perl count.pl . 
clean:
	find . -maxdepth 1 \( \! -iname "makefile" \! -iname "*.pl" \! -iname README \) -exec rm -f '{}' \;
	find . -name *~ -or -name *.*~ | xargs rm -f

