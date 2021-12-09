#!/usr/bin/perl
# script pour calculer base compostion et %GC 
$IN=$ARGV[0];
open (IN,"$IN");
    
while (<IN>)

{ if (!m/^>/)
      {
@tab=split("",$_);
      
foreach $j (0 .. $#tab-1) {$count{$tab[$j]}++;}#foreach
      
}#if
}#while
for $base (keys %count)
{

if ($base eq "G" ||$base eq "C") {$GC=$GC+$count{$base};}
    
$size=$size+$count{$base}; 

    if ($base eq "A") {$A=$A+$count{$base};}
    if ($base eq "T") {$T=$T+$count{$base};}
    if ($base eq "C") {$C=$C+$count{$base};}
    if ($base eq "G") {$G=$G+$count{$base};}
}#for
 

$GCc=$GC/$size *100;



@tab2=split (/\./,$GCc);
$k=substr($tab2 [1],0,2);

print "A\tC\tT\tG\tGCc\tsize\n";
print "$A\t$C\t$T\t$G\t$tab2[0].$k\t$size\n";

close (IN);
