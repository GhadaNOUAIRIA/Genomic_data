#!/usr/bin/perl
$IN = @ARGV[0];
open (IN, $IN);
open (OUT, ">$IN.HS");
while (<IN>)
{ @tab = split (/\s+/, $_);
if ($tab[0] ne $tab[1]) {print OUT $_ };
   }
close (IN);
close (OUT);
