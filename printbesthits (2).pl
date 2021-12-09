#!/usr/bin/perl

#usage: printbesthits.pl allsubjectsdb.HS > bestsubjectdb.HS

$IN=@ARGV[0];


open (IN, "$IN");
$V= $IN;
$V=~ s/all/best/;

open (OUT, ">$V");

$p=""; #previous protein
      
      while (<IN>)
      {
	  @tab=split (/\s+/, $_);
	  $s=$tab[0];
	  
	 print OUT $_  if ($s ne $p);
	 $p=$tab[0];

      }#while
close(IN);
close (OUT);
