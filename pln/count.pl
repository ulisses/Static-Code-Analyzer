#!/usr/bin/perl

use Path::Class;
use GD::Graph::bars;
use Getopt::Long;

GetOptions("open=s"       => \$_opt_filePath,
           "separated!"   => \$_opt_separated,
           "allTogether!" => \$_opt_allTogether,
           "percent!"     => \$_opt_percent,
           "verbose!"     => \$_opt_verbose,
           "out=s"        => \$_opt_fileNamePrefix,

           "optional:s"   => \$optionalstring,
           "int=i"        => \$mandatoryinteger,
           "optint:i"     => \$optionalinteger,
           "float=f"      => \$mandatoryfloat,
           "optfloat:f"   => \$optionalfloat);

if(!$_opt_separated && !$_opt_allTogether) {
    $_opt_separated = 1;
    $_opt_percent = 0;
}

if($_opt_separated) {
    if($_opt_percent && $_opt_verbose) {
        print "***WARNING: will deactivate -percentage, this don't make sense with -separated\n";
    }
    $_opt_allTogether = 0;
    $_opt_percent = 0;
} else {
    $_opt_allTogether = 1;
    $_opt_percent = 1;
}

my %_types = ("tcl"  => {"nrFiles" => 0, "nrLines" => 0, "comments" => sub { return shift =~ m/^[ \t\n]*#.*/; },                           "nrComments" => 0,
                         "percentageNrFiles" => 0, "percentageNrLines" => 0, "percentageNrComments" => 0
						},
              "cpp"  => {"nrFiles" => 0, "nrLines" => 0, "comments" => sub { return shift =~ m/(\*(.|\n|\r)*?\*)|(^[ \t\n]*\/\/.*)/; },    "nrComments" => 0,
                         "percentageNrFiles" => 0, "percentageNrLines" => 0, "percentageNrComments" => 0
						},
              "c"    => {"nrFiles" => 0, "nrLines" => 0, "comments" => sub { return shift =~ m/(\*(.|\n|\r)*?\*)|(^[ \t\n]*\/\/.*)/; },    "nrComments" => 0,
                         "percentageNrFiles" => 0, "percentageNrLines" => 0, "percentageNrComments" => 0
						},
              "hs"   => {"nrFiles" => 0, "nrLines" => 0, "comments" => sub { return shift =~ m/({-(.|\n|\r)*?-})|(^[ \t\n]*--.*)/; },      "nrComments" => 0,
                         "percentageNrFiles" => 0, "percentageNrLines" => 0, "percentageNrComments" => 0
						},
              "java" => {"nrFiles" => 0, "nrLines" => 0, "comments" => sub { return shift =~ m/(\*(.|\n|\r)*?\*)|(^[ \t\n]*\/\/.*)/; },    "nrComments" => 0,
                         "percentageNrFiles" => 0, "percentageNrLines" => 0, "percentageNrComments" => 0
						},
              "pl"   => {"nrFiles" => 0, "nrLines" => 0, "comments" => sub { return shift =~ m/^[ \t\n]*#.*/; },                           "nrComments" => 0,
                         "percentageNrFiles" => 0, "percentageNrLines" => 0, "percentageNrComments" => 0
						},
              "py"   => {"nrFiles" => 0, "nrLines" => 0, "comments" => sub { return shift =~ m/(^[ \t\n]*#.*)|('''(.|\n|\r)*?''')/; },     "nrComments" => 0,
                         "percentageNrFiles" => 0, "percentageNrLines" => 0, "percentageNrComments" => 0
						},
              "rb"   => {"nrFiles" => 0, "nrLines" => 0, "comments" => sub { return shift =~ m/(^[ \t\n]*#.*)|(=begin(.|\n|\r)*?=end)/; }, "nrComments" => 0,
                         "percentageNrFiles" => 0, "percentageNrLines" => 0, "percentageNrComments" => 0
						},
              "tex"  => {"nrFiles" => 0, "nrLines" => 0, "comments" => sub { return shift =~ m/^[ \t\n]*%.*/; },                           "nrComments" => 0,
                         "percentageNrFiles" => 0, "percentageNrLines" => 0, "percentageNrComments" => 0
						},
              "xml"  => {"nrFiles" => 0, "nrLines" => 0, "comments" => sub { return shift =~ m/(<!--(.|\n|\r)*?-->)/; },                   "nrComments" => 0,
                         "percentageNrFiles" => 0, "percentageNrLines" => 0, "percentageNrComments" => 0
						},
              "xsl"  => {"nrFiles" => 0, "nrLines" => 0, "comments" => sub { return shift =~ m/(<!--(.|\n|\r)*?-->)/; },                   "nrComments" => 0,
                         "percentageNrFiles" => 0, "percentageNrLines" => 0, "percentageNrComments" => 0
						}
			);
my @_files = getAllFiles($_opt_filePath);

for my $type (keys %_types) {
    if($_opt_verbose) {
        print "Working on $type...\n";
    }
    for my $file_source ( getFiles($type) ) {
        chomp $file_source;
        $_types{$type}{"nrFiles"}++;

        my $file_source_name = file($file_source);
        $file_source_name =~ $file_source_name->stringify;
        open(FILESOURCE,'<',$file_source_name) or warn "can't open $file_source_name\n";
        
        while(<FILESOURCE>) {
            $_types{$type}{"nrLines"}++;
            $_types{$type}{"nrComments"} += $_types{$type}{"comments"}($_);
        }
    }
    # if we don't want percentages , let's set the variables with row information
#    if(!$_opt_percent) {
#        if($_types{$type}{"nrFiles"} != 0) {
#            push(@_dataRatioNrFilesNrLines,$_types{$type}{"nrLines"} / $_types{$type}{"nrFiles"});
#            push(@_dataNrLines,$_types{$type}{"nrFiles"});
#            push(@_dataTypes,$type);
#            push(@_dataNrFiles,$_types{$type}{"nrLines"});
#            push(@_dataNrComments,$_types{$type}{"nrComments"});
#        }
#    }
}

if($_opt_percent) {
    my $totalNrFiles = 0;
    my $totalNrLines = 0;
    my $totalNrComments = 0;

    map {
	    $totalNrFiles += $_types{$_}{"nrFiles"};
        $totalNrLines += $_types{$_}{"nrLines"};
        $totalNrComments += $_types{$_}{"nrComments"};
	} (keys %_types);

    map {
        $_types{$_}{"percentageNrFiles"} = ($_types{$_}{"nrFiles"} / $totalNrFiles) * 100;
        $_types{$_}{"percentageNrLines"} = ($_types{$_}{"nrLines"} / $totalNrLines) * 100;
        $_types{$_}{"percentageNrComments"} = ($_types{$_}{"nrComments"} / $totalNrComments) * 100;
        #push(@_dataRatioNrFilesNrLines, (($_types{$type}[1] / $totalNrLines) / ($_types{$type}[0] / $totalNrFiles)) * 100);
	} grep($_types{$_}{"nrFiles"} != 0,keys %_types);
}

my @_dataTypes = grep($_types{$_}{"nrFiles"} != 0,keys %_types);
my @_dataNrLines = map { $_types{$_}{"nrLines"} } @_dataTypes;
my @_dataNrFiles = map { $_types{$_}{"nrFiles"} } @_dataTypes;
my @_dataNrComments = map { $_types{$_}{"nrComments"} } @_dataTypes;
my @_dataRatioNrFilesNrLines = map { $_types{$_}{"nrLines"} / $_types{$_}{"nrFiles"} } @_dataTypes;

my @_dataPercentageLines = map { $_types{$_}{"percentageNrLines"} } @_dataTypes;
my @_dataPercentageFiles = map { $_types{$_}{"percentageNrFiles"} } @_dataTypes;
my @_dataPercentageComments = map { $_types{$_}{"percentageNrComments"} } @_dataTypes;

if($_opt_allTogether) {
    plotToPng("$_opt_fileNamePrefix\_projectLanguages.png",\@_dataTypes,\@_dataPercentageLines,\@_dataPercentageFiles,\@_dataPercentageComments,"Languages", "Percentage", "Global project");
} elsif($_opt_separated) {
    plotToPngLinesAndComments("$_opt_fileNamePrefix\_LinesPerLanguage.png",\@_dataTypes,\@_dataNrLines,\@_dataNrComments,"Languages", "Number of lines", "Number of lines per language");
    plotToPng("$_opt_fileNamePrefix\_FilesPerLanguage.png",\@_dataTypes,\@_dataNrFiles,"Languages", "Number of files", "Number of files per language");
    plotToPng("$_opt_fileNamePrefix\_RatioFilesLines.png",\@_dataTypes,\@_dataRatioNrFilesNrLines,"Languages", "Number of lines per file", "Ratio of nr lines/nr files per language");
}

sub plotToPngLinesAndComments {
    my $fileName  = $_[0];
    my $dX        = $_[1];
    my $dY        = $_[2];
    my $dY2       = $_[3];
    my $x_label   = $_[4];
    my $y_label   = $_[5];
    my $title     = $_[6];
    
    my @data;
    push(@data,$dX);
    push(@data,$dY);
    push(@data,$dY2);
    my $mygraph = GD::Graph::bars->new(600, 400);
    
    my @legend_keys = ("Nr of lines","Nr of comments");
    $mygraph->set_legend(@legend_keys);

    $mygraph->set(
        transparent   => 1,
        overwrite => 0,

        # show the values for each bar in integer format separated 10 pixels from the top of the bar
        show_values   => 1,
        values_format => sub { return sprintf("\%d", shift); } ,
        values_space  => 10,

        x_label       => $x_label,
        y_label       => $y_label,
        title         => $title,
        dclrs         =>  [ qw(gold red green) ],
    ) or warn $mygraph->error;

    my $myimage = $mygraph->plot(\@data) or warn $mygraph->error;
    
    open (IMG, '>' , $fileName);
    binmode IMG;
    print IMG $myimage->png;
    close (IMG);
}


# plotToPng(FileName,dataX,dataY,x_label,y_label,title)
# plotToPng(FileName,dataX,dataY,dataY2,dataY3,x_label,y_label,title)
sub plotToPng {
    my $fileName  = $_[0];
    my $dX        = $_[1];
    my $dY        = $_[2];
    if($_opt_allTogether) {
        $dY2      = $_[3];
        $dY3      = $_[4];
        $x_label  = $_[5];
        $y_label  = $_[6];
        $title    = $_[7];
    } elsif($_opt_separated) {
        $x_label  = $_[3];
        $y_label  = $_[4];
        $title    = $_[5];
    }
    
    my @data;
    push(@data,$dX);
    push(@data,$dY);
    if($_opt_allTogether) {
        push(@data,$dY2);
        push(@data,$dY3);
    }
    my $mygraph = GD::Graph::bars->new(600, 400);
    
    if($_opt_allTogether) {
        my @legend_keys = ("% of lines","% of files","% of comments");
        $mygraph->set_legend(@legend_keys);
    }

    $mygraph->set(
        transparent   => 1,
        overwrite => 0,

        # show the values for each bar in integer format separated 10 pixels from the top of the bar
        show_values   => 1,
        values_format => sub { return sprintf("\%d", shift); } ,
        values_space  => 10,

        x_label       => $x_label,
        y_label       => $y_label,
        title         => $title,
        dclrs         =>  [ qw(gold red green) ],
    ) or warn $mygraph->error;

    my $myimage = $mygraph->plot(\@data) or warn $mygraph->error;
    
    open (IMG, '>' , $fileName);
    binmode IMG;
    print IMG $myimage->png;
    close (IMG);
}

# get all files recursively from a filePath ($path)
sub getAllFiles {
    my $path = $_[0];

    opendir (DIR, $path) or warn "can't open $path\n";

    my @files =
        map { $path . '/' . $_ }
        grep { !/^\.{1,2}$/ }
        readdir (DIR);

    closedir(DIR);

    return
        map {
            if((-d $_) && (-r $_)) {
                getAllFiles ($_);
            } elsif((-r $_) && (-T $_)) {
                $_;
            }
        }
        @files;
}

# get all files with a certain extension ($ext)
sub getFiles {
    my $ext = $_[0];

    return grep { /\.$ext$/ } @_files;
}

