#!/usr/bin/perl
#usage: print 2columns in 1column

$IN=@ARGV[0];

open (IN, "$IN");

while (<IN>)
{
    @tab=split(/\s+/, $_);
    print "$tab[0]\n$tab[2]\n";
    
}
close (IN);
