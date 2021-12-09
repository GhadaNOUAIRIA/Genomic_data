#!/usr/bin/perl
#script to split fasta protein sequences in individual fasta format files, separator = space
#use splitfasta.pl filename.pep

$IN = @ARGV[0];

open (IN, "$IN");
if ($IN eq "") {print "Usage: splitfasta.pl fasta_name"; exit;};

while (<IN>)
{ if (m/^>/)
  {  close (OUT);
    @tab1 = split (/\s+/, $_);

    open (OUT, "$tab1[0].dna");}#ifm
  print OUT $_;
  
}#while
close (IN); close (OUT);
