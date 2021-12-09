#!/usr/bin/perl
#chooses best hits


$IN = @ARGV[0];
open (IN, $IN);
$N = $IN;
$N =~ s/all//;
open (OUT, ">best$N");
$previous = "";

while (<IN>)   
{   
     @tab = split (/\s+/, $_);
  
  if ($tab[0] ne $previous) 
  {print OUT $_ ;}
     
     $previous = $tab[0];
   }
close (IN);
close (OUT);
