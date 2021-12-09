#!/usr/bin/perl

#Date: 28/01/2018 
#By: Ghada NOAUIRIA
#script to obtain reverse and complementary sequence
#Usage 

    @SEQ = `ls *R.dna`;
    while ($F = shift (@SEQ))
   
{chomp $F;
 $F =~ s/R\.dna//;
 system (`revseq $F -reverse -complement -outseq $F.rc.fasta`)

}#while

close (F);
