#!/usr/local/bin/perl -w
use strict;
use warnings;

#written by Alex and Simon 27/02/15
#to quickly format results from Mascot Daemon access files 


#be nice comment what program is for and usage
my $usage = "to use this program you need to type perl format_access_results.pl and provide a results.txt file";

#open files and set main variables
my $input = "results.txt";
my $outfile = "for_excel.txt";


#check file opens

unless (open INPUT, "$input"){
	print "Input file does not open\n";
}
        
unless (open OUT, ">$outfile"){
    print "Cannot create output file\n";
}
       
#read input with while loop
while (my $line = <INPUT>) {
    chomp $line;

    #separate long path into an array
	
my @group = split(/\\/, $line);
	my $location = -1;
	for (my $n = 0; $n < $#group; $n++) {
        my $elem = $group[$n];
        if ($elem =~ /Proteomics Projects/) {
            $location = $n;
     
         my $leader = $group[$location + 1];
         my $job = $group[$location + 2];
         my $remainder = $group[$location +4];

            my @mascot = split(/\//, $remainder);
            my @msfile = split(/\t/,$mascot[0]);
            
            print OUT "$leader\t$job\t$msfile[0]\t$mascot[7]\t$mascot[8]\n";    
        }
	}

   if ($location == -1) {
       print OUT "This script expected a path including Proteomics Protjects. Instead it found \t$line\n";   
    }	

}

close INPUT;
close OUT;

exit;