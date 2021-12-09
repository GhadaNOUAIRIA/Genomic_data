#!/usr/bin/perl
# usage: rbh.pl bestxxyy.H bestyyxx.HS > xxyy.rbh

$B1=@ARGV[0]; # bestxxyy.HS
$B2=@ARGV[1]; # bestyyxx.HS

open (B1, "$B1");

while (<B1>)
{
    @tab=split(/\s+/, $_);
       
    $BEST1{$tab[0]}= $tab[1];

}#while B1
close (B1);

open (B2, "$B2");

while (<B2>)
{
    @tab=split(/\s+/, $_);
    if ($BEST1{$tab[1]} eq $tab[0]) {print "$tab[1]\t$tab[0]\n";}#if

}#while B2
close (B2);
