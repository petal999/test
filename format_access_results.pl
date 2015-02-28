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
my @group = split('\\,$line);
my $leader = $group[7];
my $job = $group[8]; 

print OUT "$leader\t$job\n";

}

close INPUT;
close OUT;

exit;