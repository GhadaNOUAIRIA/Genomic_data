#!/usr/bin/perl

# usage : GCcontent.pl XX.seq 

$IN=$ARGV[0];
open(IN, "$IN");

while (<IN>)
{
    if (!m/^>/)
    {
	@tab=split("", $_);
	
	foreach $j(0..$#tab-1)
{
    $count{$tab[$j]}++

}#foreach

    }#if

}#while

close (IN); 


for $base (keys %count)
{
    print "$base\t$count{$base}\n";
    if ($base eq "G" || $base eq "C") {$GC=$GC+$count{$base}};
    $size=$size+$count{$base};
       
}#for

print "GC\t$GC\n";

print "size\t$size\n";

$GCcontent=$GC/$size*100;

@tab2=split(/\./, $GCcontent);
$k=substr($tab2[1],0,2);
print "GCcontent\t$tab2[0].$k\n";


