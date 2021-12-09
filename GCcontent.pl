#!/usr/bin/perl

#counting GC content percentage

$IN=$ARGV[0];
open (IN, "$IN");

while (<IN>)
{
    if (!m/^>/)
    {
	@tab=split('',$_);

	foreach $j (0..$#tab-1)
	{
	    $count{$tab[$j]}++;

	}#fin foreach 

    }#fin if
}#fin while

	for $base (keys %count)
	{
	    print "$base\t$count{$base}\n";
	    
	   if ($base eq "G" || $base eq "C")
{
    $GC = $GC + $count{$base};}
$size = $size + $count{$base};
	}
 print "GC\t$GC\n";
print "Size\t$size\n";
$GCcontent = $GC/$size*100;

@tab2=split(/\./, $GCcontent);

$k=substr($tab2[1],0,2);

print "GCContent\t$tab2[0].$k\n";
	
  
close (IN);

	
