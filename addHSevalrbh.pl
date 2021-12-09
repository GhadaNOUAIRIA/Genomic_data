#!/usr/bin/perl
#usage: xxyy.rbh bestxxyy.HS > xxyy.rbheval

open (B, "bestzyrocagl.HS");

while(<B>)
{
    @tab=split(/\s+/, $_);
    $Beval{$tab[0]}=$tab[10];
}#while B
close (B);

open (R, "zyrocagl.rbhsize");

while(<R>)
{
    @tab=split(/\s+/, $_);
    print "$tab[0]\t$tab[1]\t$tab[2]\t";
    print "HS\t";
    print "$Beval{$tab[0]}\n";

}#while R
close (R);
