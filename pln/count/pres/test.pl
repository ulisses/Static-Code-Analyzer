use GD::Graph::lines;

plotPng(@ARGV[0]);

sub plotPng {    
    my $fileName = shift;
    @data = ( ["1st","2nd","3rd","4th","5th","6th","7th", "8th", "9th"],
              [    1,    2,    5,    6,    3,  1.5,    1,     3,     4]
            );
    my $mygraph = GD::Graph::lines->new(600, 400);
    
    $mygraph->set (
        x_label => "Contestant",
        y_label => "Time",
		values_format => sub { return sprintf("\%d", shift); } ,
		values_space  => 10,
		show_values  => 1,

        title         => "Times of the contestants",
        dclrs         =>  [ qw(gold red green) ]
    ) or warn $mygraph->error;

    my $myimage = $mygraph->plot(\@data) or warn $mygraph->error;
    
    open (IMG, '>' , $fileName);
    binmode IMG;
    print IMG $myimage->png;
    close (IMG);
}
