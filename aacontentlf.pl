#!/usr/bin/perl

#counting GC content percentage

$IN=$ARGV[0];
open (IN, "$IN");

while (<IN>)
{
    if (!m/^>/)
    {
	@tab=split("",$_);

	foreach $j (0..$#tab-1)
	{
	    $count{$tab[$j]}++;

	}#fin foreach 

    }#fin if
}#fin while

	for $base (keys %count)
	{
	

if ($base eq "A")
{$A=$count{$base};}

if ($base eq "T")
{$T=$count{$base};}

if ($base eq "C")
{$C=$count{$base};}

if ($base eq "G")
{$G=$count{$base};}


if ($base eq "R")
{$R=$count{$base};}

if ($base eq "N")
{$N=$count{$base};}

if ($base eq "D")
{$D=$count{$base};}

if ($base eq "Q")
{$Q=$count{$base};}

if ($base eq "E")
{$E=$count{$base};}

if ($base eq "H")
{$H=$count{$base};}

if ($base eq "L")
{$L=$count{$base};}

if ($base eq "I")
{$I=$count{$base};}

if ($base eq "K")
{$K=$count{$base};}

if ($base eq "M")
{$M=$count{$base};}

if ($base eq "F")
{$F=$count{$base};}


if ($base eq "P")
{$P=$count{$base};}

if ($base eq "S")
{$S=$count{$base};}

if ($base eq "A")
{$A=$count{$base};}

if ($base eq "W")
{$W=$count{$base};}

if ($base eq "Y")
{$Y=$count{$base};}


if ($base eq "V")
{$V=$count{$base};}

if ($base eq "B")
{$B=$count{$base};}

 $size = $size + $count{$base};

	}#for




 print "A\tR\tN\tD\tC\tQ\tE\tG\tH\tI\tL\tK\tM\tF\tP\tS\tT\tW\tY\tV\tB\tSize\n";
print "$A\t$R\t$N\t$D\t$C\t$Q\t$E\t$G\t$H\t$I\t$L\t$K\t$M\t$F\t$P\t$S\t$T\t$W\t$Y\t$V\t$B\t$size\n";

	
  
close (IN);

	
