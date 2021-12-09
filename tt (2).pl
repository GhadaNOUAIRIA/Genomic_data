#!/usr/bin/perl

while (<>)
{
    @tab=split(/\s+/, $_);
    print "$tab[1]\t$tab[0]\n";

}
