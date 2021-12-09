#!/usr/bin/perl

#renumber class ranks in XX.mclclusters file
#Usage: renumclass.pl XX.mclclusters &
# output file XX.mclclusters with ordered classes.

$IN=@ARGV[0]; # XX.mclclusters
open(IN,"$IN"); 

$OUT="ZZZ";
if ( -e "ZZZ" ) {system("rm ZZZ");}
open (OUT,">>$OUT");
$CP=""; #preceding class

$r=0; #rank
$R=0; #class size

while(<IN>)
{

    @tab=split(/\s+/, $_);

    if ( $tab[1] ne $R ) { $r=0; }
    if ( $tab[0] ne $CP) { $r++; $ID = "C".$tab[1].".$r"; }

#    print "tab0=$tab[0]\ttab1=$tab[1]\tr=$r\tR=$R\t\tID=$ID\ttab2=$tab[2]\n";
    print OUT "$ID\t$tab[1]\t$tab[2]\n";

    $R=$tab[1];
    $CP=$tab[0];

}

close(IN);
close(OUT);

system(`mv "$OUT" "$IN"`);


