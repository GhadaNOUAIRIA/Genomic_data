#!/usr/bin/perl

#count number of matches

$IN=@ARGV[0];

$name=$IN;
$name=~ s/all//;
$name=~ s/.HS/mmhits/;

$previous ="";


open (IN, "$IN");
open (OUT, ">$name");
while (<IN>)
{    
@tab=split (/\s+/, $_);

if ($tab[1] ne $previous)
{$previous = $tab[1];
 if ($n) {print OUT "$n\n";}
 print OUT "$previous\t";
	$n=1;
 }
else { $n++;}
}
print OUT "$n\n";

close (IN);
close (OUT);
