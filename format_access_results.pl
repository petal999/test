#!/usr/local/bin/perl -w
use strict;
use warnings;

#written by Alex 27/02/15
#to quickly format results from Mascot Daemon access files 


#be nice comment what program is for and usage

my $usage = "to use this program you need to type perl format_access_results.pl and provide a results.txt";

#open files and set main variables
my $input = "results.txt";
my $outfile = "for_excel.tab";


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
        }
	}
   
    if ($location == -1) {
        # handle somehow!
        print "You uploaded it wrong\n";   
    }
   
    
my $leader = $group[$location + 1];
   
 my $job = $group[$location + 2];
    my $mascot = $group[$location + 12];
  
    #foreach (@group) {
	#   print "$_\n";
	#   }


	#print "$group[17]\n";  
	#print "$leader\t$job\t$mascot\n";

    print "$leader\t$job\t$mascot\n";
}

close INPUT;
close OUT;

exit;