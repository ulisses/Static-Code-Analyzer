all:
	perl count.pl log_* 
clean:
	find . -maxdepth 1 \( \! -iname "log*" -type f \! -iname "makefile" \! -iname "*.pl" \) -exec rm '{}' \;
	find . -name *~ -or -name *.*~ | xargs rm
