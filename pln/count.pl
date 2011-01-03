#!/usr/bin/perl -w

use Path::Class;
use GD::Graph::bars;
use strict;

my @dataNrLines;
my @dataNrFiles;
my @dataRatioNrFilesNrLines;
my @dataTypes;

my @types = ("tcl", "cpp", "c", "hs", "java", "pl");
my $filePath = $ARGV[0];

for my $type (@types) {
	my $nrLines = 0;
	my $nrFiles = 0;
	for my $file_source ( get_files($filePath,$type) ) {
		chomp $file_source;
		$nrFiles++;
		
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
	if($nrFiles != 0) {
		push(@dataRatioNrFilesNrLines,$nrLines / $nrFiles);
	}
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

sub get_files {
	my $path = $_[0];
	my $ext = $_[1];

	opendir (DIR, $path) or die "Unable to open $path: $!";

	my @files =
		map { $path . '/' . $_ }
		grep { !/^\.{1,2}$/ }
		readdir (DIR);

	return
		grep { (/\.$ext$/) }
		map { -d $_ ? get_files ($_ ,$ext) : $_ }
		@files;
}

