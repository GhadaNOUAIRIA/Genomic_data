#!/usr/bin/perl
# counting number of duplications of every element in the first list

open(IN, "allSACESACEhits");


while (<IN>)
{
    @tab=split(/\s+/,$_);
    $count{$tab[0]}++;
    
} # close while

for $word (keys %count)
{
    print "$word\t$count{$word}\n";

} #close for


close (IN);
