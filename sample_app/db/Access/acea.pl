#!/usr/bin/perl -ws

use strict; use warnings;

use Access;

my $access = Access->new;
#$access->test_up('test 12');

my @array = $access->get_users;

foreach(sort {$a->name cmp $b->name} @array){
	print $_->name . "\n";
}

