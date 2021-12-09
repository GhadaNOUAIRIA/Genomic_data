#!/usr/bin/perl

#extract columns from allsacesace.HS file to comply with the structure of allsaceseqnew.HS (expected for mcl scripts).
$IN=@ARGV[0]; #input file allsacesace.HS

open(IN,"$IN");
while(<IN>)
{

    @tab=split(/\s+/,$_);
    print "$tab[0]\t$tab[3]\t$tab[1]\tHS\t$tab[$#tab-1]\n";

}
close (IN);
