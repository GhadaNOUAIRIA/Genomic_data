#!/usr/bin/perl
$IN=@ARGV[0];
open(IN,"$IN");
if ($IN eq "") {print "Usage: splitfasta.pl fasta_name"; exit;}
close (IN);


