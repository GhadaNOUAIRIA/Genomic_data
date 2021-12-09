#!/usr/bin/perl

$IN=@ARGV[0]; 

if ($IN eq "") {print "usage: splitfasta.pl dbnuclfile.fasta\n"; exit}

open (IN, "$IN");

while (<IN>)
{
     print $_;
	
    if (m/^>/)
        {
	close (OUT);
	@tab=split(/\n+/, $_);
         $idseq=$tab[0];
         $idseq =~ s/\n//g;
        open (OUT, "$idseq.dna");
        
         } #if
  
    print OUT $_;

} #while
close (IN);
close (OUT);
