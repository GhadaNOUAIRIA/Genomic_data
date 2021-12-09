#!/usr/bin/perl
$IN=@ARGV[0];
open(IN,"$IN");
while (<IN>)
{
    @tab=split(/\s+/, $_);
    print "$tab[1]\t$tab[0]\n";

}
