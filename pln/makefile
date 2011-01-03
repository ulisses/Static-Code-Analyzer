all:
	rm -f *.png
	perl count.pl . 
clean:
	find . -maxdepth 1 \( \! -iname "log*" -type f \! -iname "makefile" \! -iname "*.pl" \) -exec rm '{}' \;
	find . -name *~ -or -name *.*~ | xargs rm

