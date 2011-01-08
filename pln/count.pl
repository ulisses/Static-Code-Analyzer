#!/usr/bin/perl

use Path::Class;
use GD::Graph::bars;
use Getopt::Long;

GetOptions("open=s"       => \$_opt_filePath,
           "separated!"   => \$_opt_separated,
           "allTogether!" => \$_opt_allTogether,
           "percent!"     => \$_opt_percent,
           "verbose!"     => \$_opt_verbose,
           "out=s"        => \$_opt_out,

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
    $_opt_allTogether = 0;
    $_opt_percent = 0;
} else {
    $_opt_allTogether = 1;
    $_opt_percent = 1;
}

my @_dataNrLines;
my @_dataNrFiles;
my @_dataRatioNrFilesNrLines;
my @_dataTypes;

# type => [nrFiles,nrLines]
my %_types = ("tcl" => [0,0] , "cpp" => [0,0], "c" => [0,0], "hs" => [0,0], "java" => [0,0], "pl" => [0,0], "py" => [0,0], "rb" => [0,0],
              "tex" => [0,0], "xml" => [0,0], "xsl" => [0,0]);
my @_files = getAllFiles($_opt_filePath);

for my $type (keys %_types) {
    if($_opt_verbose) {
        print "Working on $type...\n";
    }
    for my $file_source ( getFiles($type) ) {
        chomp $file_source;
        $_types{$type}[0]++;

        my $file_source_name = file($file_source);
        $file_source_name =~ $file_source_name->stringify;
        open(FILESOURCE,'<',$file_source_name) or warn "can't open $file_source_name\n";
        $_types{$type}[1]++ while <FILESOURCE>;
    }
    # if we don't want percentages , let's set the variables with row information
    if(!$_opt_percent) {
        if($_types{$type}[0] != 0) {
            push(@_dataRatioNrFilesNrLines,$_types{$type}[1] / $_types{$type}[0]);
            push(@_dataNrLines,$_types{$type}[1]);
            push(@_dataTypes,$type);
            push(@_dataNrFiles,$_types{$type}[0]);
        }
    }
}

if($_opt_percent) {
    my $totalNrFiles = 0;
    my $totalNrLines = 0;

    for my $type (keys %_types) {
        $totalNrFiles += $_types{$type}[0];
        $totalNrLines += $_types{$type}[1];
    }

    for my $type (keys %_types) {
        # if we have at least one file of this type, process.
        if($_types{$type}[0] != 0) {
            push(@_dataTypes, ($type));
            push(@_dataNrLines, ($_types{$type}[1] / $totalNrLines) * 100);
            push(@_dataNrFiles, ($_types{$type}[0] / $totalNrFiles) * 100);
            #push(@_dataRatioNrFilesNrLines, (($_types{$type}[1] / $totalNrLines) / ($_types{$type}[0] / $totalNrFiles)) * 100);
        }
    }
}

if($_opt_allTogether) {
    plotToPng("$_opt_out\_projectLanguages.png",\@_dataTypes,\@_dataNrLines,\@_dataNrFiles,\@_dataRatioNrFilesNrLines,"Languages", "Percentage", "");
} elsif($_opt_separated) {
    plotToPng("$_opt_out\_LinesPerLanguage.png",\@_dataTypes,\@_dataNrLines,"Languages", "Number of lines", "Number of lines per language");
    plotToPng("$_opt_out\_FilesPerLanguage.png",\@_dataTypes,\@_dataNrFiles,"Languages", "Number of files", "Number of files per language");
    plotToPng("$_opt_out\_RatioFilesLines.png",\@_dataTypes,\@_dataRatioNrFilesNrLines,"Languages", "Number of lines per file", "Ratio of nr lines/nr files per language");
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
        #push(@data,$dY3);
    }
    my $mygraph = GD::Graph::bars->new(600, 400);
    
    if($_opt_allTogether) {
        my @legend_keys = ("% of lines","% of files");
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

sub getFiles {
    my $ext = $_[0];

    return grep { /\.$ext$/ } @_files;
}

