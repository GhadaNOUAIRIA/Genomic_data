#!/usr/bin/perl


#script to prepare tab formatted oRF names in use with mcxdeblast mcl script

$IN=@ARGV[0];   # file containing ORF names in alphabetical order

$i=0;
open(IN,"$IN") || "die can't open $IN";
print "#<mapped index> <tag>\n";
print "# sort mode is alphabetical\n";
while(<IN>)
{

    print "$i $_";
    $i++;


}
