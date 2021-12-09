#!/usr/bin/perl

#formatting fasta files from ncbi and concatenation

#usage: put the script in the file containing only the fasta files you want to format and concatenate, and run it

@list = `ls *.fasta`;

while ($F = shift (@list))
{ chomp $F;
print "$F";
system (`sed -e "s/>lcl|/>/g" $F >> allref.fasta`);
}
