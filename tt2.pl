#!/usr/bin/perl

while (<>)
{
    @tab=split(/\s+/, $_);
    print "$tab[2]\t$tab[3]\t$tab[0]\t$tab[1]\n";

}
