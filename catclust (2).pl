#!/usr/bin/perl
#usage: catclust.pl sfamORTH-CML

$IN=@ARGV[0];

open (I, "$IN");
open (O, "$OUT");

while (<I>)
{
    @tab=split(/\s+/,$_);
    $OUT="$tab[2]".".pep";
    print "OUT\t$OUT\n";
    
    if (m/^SACE/) {system ("cat /home/bcgaipt201711/home0/blastdb/allsaceprt.fasta/$tab[0].prt >> $OUT");}
    if (m/^CAGL/) {system ("cat /home/bcgaipt201711/home0/blastdb/allcaglprt.fasta/$tab[0].prt >> $OUT");}
    if (m/^ZYRO/) {system ("cat /home/bcgaipt201711/home0/blastdb/allzyroprt.fasta/$tab[0].prt >> $OUT");}
    
}#whileI
close (IN);
close (OUT);

