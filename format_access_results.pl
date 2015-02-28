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
   my $folder = $group[5];
   
my $leader = $group[6];
   
my $job = $group[7];
   my $mascot = $group[17];
  
#foreach (@group) {
#   print "$_\n";
#   }
   

#print "$group[17]\n";  
#print "$leader\t$job\t$mascot\n";

if ($folder =~ /Proteomics Projects/){
	print "yes matches\n";
} else {
	print "nope no Proteomics Projects\n";
	}

}

close INPUT;
close OUT;

exit;