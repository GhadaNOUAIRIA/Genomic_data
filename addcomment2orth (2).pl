#!/usr/bin/perl
#usage: catclust.pl sfamORTH-MCL > sfamORTH-MCL.comments

$IN=@ARGV[0];

open (I, "$IN");

while (<I>)
{
    chomp $_;
    @tab=split(/\s+/,$_);
        
    if (m/^SACE/) {@comment=split(/\s+/,`grep -w $tab[0] /home/bcgaipt201711/home0/blastdb/allsaceprt.fasta/$tab[0].prt | sed -e "s/>//g"`, 2);}
    if (m/^CAGL/) {@comment=split(/\s+/,`grep -w $tab[0] /home/bcgaipt201711/home0/blastdb/allcaglprt.fasta/$tab[0].prt | sed -e "s/>//g"`, 2);}
    if (m/^ZYRO/) {@comment=split(/\s+/,`grep -w $tab[0] /home/bcgaipt201711/home0/blastdb/allzyroprt.fasta/$tab[0].prt | sed -e "s/>//g"`, 2);}
    
    print "$_\t$comment[1]";
    
}#whileI
close (IN);




   
   
    
    
