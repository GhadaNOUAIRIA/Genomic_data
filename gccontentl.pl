#!/usr/bin/perl

#counting GC content percentage
#usage gccontentl.pl filename.dna

$IN=$ARGV[0];
open (IN, "$IN");


while (<IN>)
{
    if (!m/^>/)
	{$tmp=$_; $tmp =~ tr/a-z/A-Z/;
    
	@tab=split("",$tmp);

	foreach $j (0..$#tab-1)
	{
	    $count{$tab[$j]}++;

	}#fin foreach 

    }#fin if
}#fin while

	for $base (keys %count)
	{
        
	    
	   if ($base eq "G" || $base eq "C")
{
    $GC = $GC + $count{$base};
}

$size = $size + $count{$base};
	

if ($base eq "A")
{$A=$count{$base};}

if ($base eq "T")
{$T=$count{$base};}

if ($base eq "C")
{$C=$count{$base};}

if ($base eq "G")
{$G=$count{$base};}
	}#for

$GCcontent = $GC/$size*100;
        
@tab2=split(/\./, $GCcontent);

$k=substr($tab2[1],0,2);

$GCcontent = "$tab2[0]".".$k";

 print "A\tC\tT\tG\tGC%\tSize\n";
print "$A\t$C\t$T\t$G\t$GCcontent\t$size\n";

	
  
close (IN);

	
