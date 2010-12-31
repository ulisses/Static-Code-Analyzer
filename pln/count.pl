#!/usr/bin/perl -w
# Change above line to point to your perl binary

use Path::Class;
use CGI ':standard';
use GD::Graph::area;
use GD::Graph::bars;
use strict;

my @dataNrLines;
my @dataNrFiles;
my @dataRatioNrFilesNrLines;
my @dataTypes;

for my $file (@ARGV) {
	open(FILE, '<', $file) or do {
		warn "can't open $file\n";
	};
	
	my $type = +(split "_" , $file)[1];
	
	my $nrLines = 0;
	my $nrFiles = 0;
	for my $file_source (<FILE>) {
		$nrFiles++;
		$file_source =~ s/\n//g; 
		$file_source =~ s/\r//g; 
		
		my $file_source_name = file($file_source);
		$file_source_name =~ $file_source_name->stringify;
		open(FILESOURCE,'<',$file_source_name) or do {
			warn "can't open $file_source_name\n";
		};
		$nrLines++ while <FILESOURCE>;
	}
	
	push(@dataNrLines,$nrLines);
	push(@dataTypes,$type);
	
	push(@dataNrFiles,$nrFiles);
	push(@dataRatioNrFilesNrLines,$nrLines / $nrFiles);

#	print "temos $nrLines linhas em $nrFiles ficheiros de $type \n";
}

plotToPng("LinesPerLanguage.png",[@dataTypes],[@dataNrLines],"Languages", "Number of lines", "Number of lines per language");
plotToPng("FilesPerLanguage.png",[@dataTypes],[@dataNrFiles],"Languages", "Number of files", "Number of files per language");
plotToPng("RatioFilesLines.png",[@dataTypes],[@dataRatioNrFilesNrLines],"Languages", "Number of lines per file", "Ratio of nr lines/nr files per language");

# plotToPng(FileName,dataX,dataY,x_label,y_label,title)
sub plotToPng {
	my $fileName = $_[0];
	my $dX = $_[1];
	my $dY = $_[2];
	my $x_label = $_[3];
	my $y_label = $_[4];
	my $title = $_[5];

	my @data;
	push(@data,$dX);
	push(@data,$dY);

	my $mygraph = GD::Graph::bars->new(500, 300);
	$mygraph->set(
		x_label     => $x_label,
		y_label     => $y_label,
		title       => $title,
	) or warn $mygraph->error;

	my $myimage = $mygraph->plot(\@data) or die $mygraph->error;
	
	open (MYFILE, '>' , $fileName);
	print MYFILE $myimage->png;
	close (MYFILE);
}

