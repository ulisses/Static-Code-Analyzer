use Makefile::Parser;
use Getopt::Long;

#use this way:
#	perl makefile.pl -open makefile

GetOptions("open=s"       => \$_opt_makefile);

$parser = Makefile::Parser->new($_opt_makefile);
$parser->parse($_opt_makefile) or die Makefile::Parser->error;

@l = $parser->target->commands;
$command = @l[-1];

if( $command =~ m/.*gcc .* -o ?(.*) .*/ ) {
	print $1;
} else {
	print "a.out";
}


