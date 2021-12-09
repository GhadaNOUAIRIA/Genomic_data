#!/usr/bin/perl
#usage: All parlogs identification 
# script.pl species1.paralogs species2.paralogs species3.paralogs ORTH.mclclusters

$SP1=@ARGV[0];
$SP2=@ARGV[1];
$SP3=@ARGV[2];
$IN=@ARGV[3];

open (SP1, "$SP1");
 while (<SP1>)
 {
     @tab=split(/\s+/, $_);
     $SP1PAR{$tab[0]}=$tab[1];

}#while
close (SP1);

open (SP2, "$SP2");
 while (<SP2>)
 {
     @tab1=split(/\s+/, $_);
     $SP2PAR{$tab1[0]}=$tab1[1];

 }#while
close (SP2);

open (SP3, "$SP3");
 while (<SP3>)
 {
     @tab2=split(/\s+/, $_);
     $SP3PAR{$tab2[0]}=$tab2[1];

}#while
close (SP3);

open (IN, "$IN");

while (<IN>)
{
   
    @tab3=split(/\s+/, $_);

    if ($SP1PAR{$tab3[2]}) {print "$tab3[2]\t$SP1PAR{$tab3[2]}\t$tab3[0]\n";}
    elsif ($SP2PAR{$tab3[2]}) {print "$tab3[2]\t$SP2PAR{$tab3[2]}\t$tab3[0]\n";}
    elsif ($SP3PAR{$tab3[2]}) {print "$tab3[2]\t$SP3PAR{$tab3[2]}\t$tab3[0]\n";}
 
}#while

close (IN);
