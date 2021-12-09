#!/usr/bin/perl
# usage: allrbh.pl allxxyy.HS (output = allxxyy.RHS)

$IN=@ARGV[0];

$tmp=$IN;
$tmp =~ s/HS/RHS/;
$OUT=$tmp;

open(IN, "$IN");
open(OUT, ">$OUT");

while (<IN>)
{
    @tab=split(/\s+/,$_);
   
    if (`grep -w ^$tab[1] $IN | grep -w $tab[0]`)
    {
	print OUT $_;
    }
 }
close (IN);
close (OUT);
