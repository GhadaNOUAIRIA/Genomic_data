#!/usr/bin/perl

#Date: 12/01/2018 
#By: Ghada NOAUIRIA
#script to put all fastq individual sequences in one file, the name of the file will be the name of the sequence in the final file
#usage: put the script in the directory where all .fastq files are and then execute it: allseq_toonefile > Sequencename.fastq

@SEQ = `ls *.ab1`;
    while ($F = shift (@SEQ))
{
 #$name = $F;
 #$name =~ s/.ab1//;
#print "\@$name";
open (F, "$F");
 while (<F>) 
{ 
print "$_";}#while1
close (F);
}

