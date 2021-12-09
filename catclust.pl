#!/usr/bin/perl
#usage: script.pl sfamORTH-MCLs > FAMSEQ

$IN=@ARGV[0];

open (IN, "$IN");
open (OUT, "$OUT");
 while (<IN>)
 {
     @tab=split(/\s+/, $_);
     $OUT="$tab[2]".".pep";
     print OUT "$OUT\n";

     if (m/^SACE/) {system ("cat /home/bcgaipt201723/home0/blastdb/allsaceprt.fasta/$tab[0].prt >> $OUT");}
     elsif (m/^CAGL/) {system ("cat /home/bcgaipt201723/home0/blastdb/allcaglprt.fasta/$tab[0].prt >> $OUT");}
     else {system ("cat /home/bcgaipt201723/home0/blastdb/allzyroprt.fasta/$tab[0].prt >> $OUT");}

}#while
close (IN);
close (OUT);
