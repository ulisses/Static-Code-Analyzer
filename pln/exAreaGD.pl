#!/usr/bin/perl -w
# Change above line to point to your perl binary

use CGI ':standard';
use GD::Graph::area;
use strict;

# Both the arrays should same number of entries.
my @data = (["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug",
             "Sep", "Oct", "Nov", "Dec"],
			             [23, 5, 2, 20, 11, 33, 7, 31, 77, 18, 65, 52]);

						 my $mygraph = GD::Graph::area->new(500, 300);
						 $mygraph->set(
						     x_label     => 'Month',
							     y_label     => 'Number of Hits',
								     title       => 'Number of Hits in Each Month in 2002',
									 ) or warn $mygraph->error;

									 my $myimage = $mygraph->plot(\@data) or die $mygraph->error;

									 print "Content-type: image/png\n\n";
									 print $myimage->png;
