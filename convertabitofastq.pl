#!/usr/bin/perl

#Date: 12/01/2018 
#By: Ghada NOAUIRIA
#script to convert abi files issued from sanger sequencing to fastq files
#You need to previously install emboss utilities <sudo apt-get install emboss>
#Usage 

    @SEQ = `ls *.ab1`;
    while ($F = shift (@SEQ))
   
{ system (`seqret -sformat abi -osformat fastq-sanger -sequence $F -outseq all.fastq -auto`)

}#while

close (F);
