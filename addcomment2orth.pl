#!/usr/bin/perl
#usage:sfamORTH-MCL output:sfamORTH-MCL. include comments of *.prt

$IN=@ARGV[0];
open (I, "$IN");
open (OUT,">sfamORTH-MCL.comment");

while (<I>)
{
    @tab=split(/\s+/,$_);
    $class=$_;
    chomp $class;
    if (m/^SACE/) {@ANNDT=split(/\s+/,`grep -w $tab[0] /home/bcgaipt201723/home0/blastdb/allsaceprt.fasta/$tab[0].prt | sed -e "s/>//g"`,2);
                   print  OUT "$class\t@ANNDT[1]";}
     if (m/^CAGL/) {@ANNDT=split(/\s+/,`grep -w $tab[0] /home/bcgaipt201723/home0/blastdb/allcaglprt.fasta/$tab[0].prt | sed -e "s/>//g"`,2);
                   print  OUT "$class\t@ANNDT[1]";}
   if (m/^ZYRO/) {@ANNDT=split(/\s+/,`grep -w $tab[0] /home/bcgaipt201723/home0/blastdb/allzyroprt.fasta/$tab[0].prt | sed -e "s/>//g"`,2);
         print  OUT "$class\t@ANNDT[1]";}
}#whileI
close (I);
close (OUT);

