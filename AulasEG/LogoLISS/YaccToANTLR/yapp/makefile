yacctoantlr:grammar.yp
	yapp -b '/usr/bin/perl -s' -m YaccToANTLR -s -o yacctoantlr grammar.yp
	chmod 755 yacctoantlr
run:yacctoantlr
	./yacctoantlr teste1.y
clean:
	find . -maxdepth 1 \( \! -iname "*.y" \! -iname "makefile" \! -iname "*.yp" \! -iname "*.pl" \) -exec rm -f '{}' \;
	find . -name *~ -or -name *.*~ | xargs rm -f

