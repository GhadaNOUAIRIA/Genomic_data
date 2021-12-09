#!/usr/bin/perl

# usage : nom.pl > xx.ident print ORF in position 0

while (<>)

 {
     @tab = split (/\s+/, $_);
	 print "$tab[0]\n";

 }
