#!/usr/bin/perl

# compteur de fréquence des gènes


$IN=$ARGV[0];
$OUT=$ARGV[1];

open (IN, "$IN");
open (OUT, ">$OUT");

while (<IN>)
{
    
    @tab=split(/\s+/, $_);
    $count{$tab[0]}++;
    
} #while

for $word (keys %count)
{
    print OUT "$word\t$count{$word}\n";
    
}#for

close (IN); close (OUT);

system("sort -n -k 2 -r SACEmm.freq $OUT > temp");

system("mv temp $OUT");



    
