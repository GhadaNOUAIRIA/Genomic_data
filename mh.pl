#!/usr/bin/perl
# counting number of duplications of every element in the first list

$IN=$ARGV[0];
$OUT=$ARGV[1];

open(IN,"$IN");
open(OUT,">$OUT");

while (<IN>)
{
    @tab=split(/\s+/,$_);
    $count{$tab[0]}++;
    
} # close while

for $word (keys %count)
{
    print OUT "$word\t$count{$word}\n";

} #close for

close (IN); close (OUT);

system ("sort -n -k 2 -r $OUT > temp");
system ("mv temp $OUT");
