#!/usr/bin/perl

# usage: printallhits.pl allxxyy  

$IN=@ARGV[0];


open (IN, "$IN");
open (OUT, ">$IN.HS");
      
      while (<IN>)
      {
          @tab=split (/\s+/, $_);
	  
         print OUT $_  if ($tab[0] ne $tab[1]); 

      }#while
      close(IN); 
