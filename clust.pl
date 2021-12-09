#!/usr/bin/perl
$IN=ARGV[0];
system ("clustalw -infile=$IN -align -output=PHYLIP 2>&1 > /dev/null");

