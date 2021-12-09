#!/usr/bin/perl
#usage: for each ORF ==> paralogs
# script.pl XX.ident XX.mclclusters(paralogs) > XX.paralogs 

$ORF=@ARGV[0];
$PAR=@ARGV[1];

open (P, "$PAR");
 while (<P>)
 {
     chomp $_;
     @tab=split(/\s+/, $_);
     $CPAR{$tab[2]}=$tab[0];

}#while

close (P);

open (O, "$ORF");

while (<O>)
{
    chomp $_;
    @tab=split(/\s+/, $_);

    if ($CPAR{$tab[0]}) {print "$tab[0]\t$CPAR{$tab[0]}\n"; next;}

     print "$tab[0]\tsingle\n";
 
}#while

close (O);
