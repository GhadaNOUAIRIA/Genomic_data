#!/usr/bin/perl
#This script extracts identifications from fasta file

open (IN, "GSACE.pep");


    while (<IN>)
{

    if (m/^>/) {  

	s/>//g;
	@tab = split (/\s+/,$_);


	print "$tab[0]\n";


} # pour if m
} # pour while

close (IN);



