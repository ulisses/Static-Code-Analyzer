use Makefile::Parser;

#use this way:
#	perl makefile.pl makefile

$parser = Makefile::Parser->new($ARGV[0]);
$parser->parse() or die Makefile::Parser->error;

@l = $parser->target->commands;
$command = @l[-1];

if( $command =~ m/.*gcc .* -o ?(.*) .*/ ) {
	print $1;
} else {
	print "a.out";
}


