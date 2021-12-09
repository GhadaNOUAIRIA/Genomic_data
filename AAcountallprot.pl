#!/usr/bin/perl
# AA content d'une séquence proteique

@AA= ('A','R', 'N', 'D', 'C', 'Q', 'E', 'G', 'H', 'I', 'L', 'K', 'M', 'F', 'P', 'S', 'T', 'W', 'Y', 'V', 'B');

    print "seqname";

foreach $j (0 .. $#AA)
    
       {
	   print "\t$AA[$j]";} 
	   print "\tsize\n";
         
$IN=$ARGV[0];

open (IN, $IN);

while (<IN>)
{   

    if (!m/^>/)
	
    {
	@tab=split('', $_);
        
	foreach $j (0 .. $#tab-1)
            {
		$count{$tab[$j]}++;
            }#foreach
	
    }#if

    
    if (m/^>/) {

	(s/>//g);
	
	@y=split(/\s+/,$_); $GSACEPE=$y[0];         
    }#if
    
}#while

close (IN);
# calcul des pourcentage des acides aminés

    $x=substr($IN, 1,4);

    print "$x";

   foreach $aa (0 .. $#AA) {print "\t$count{$AA[$aa]}";  
    $size=$size + $count{$AA[$aa]};
    }#foreach
           print"\t$size\n";


print "$x";
foreach $aa (0 .. $#AA)
      {
    $x=$count{$AA[$aa]}/$size *100;
    @tab=split(/[\.]/, $x);
    $y=substr($tab[1], 0, 2);
    $z="$tab[0]".".$y";
    print"\t$z";
    $tot=$tot + $z;
}
 print"\t$tot\n";
