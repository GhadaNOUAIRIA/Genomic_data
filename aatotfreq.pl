#!/usr/bin/perl

# AAcontent du protéome d'un génôme

@AA=('A', 'R', 'N', 'D', 'C','Q', 'E','G', 'H', 'I', 'L', 'K', 'M', 'F', 'P', 'S', 'T', 'W', 'Y', 'V', 'B');

print "Proteom";

foreach $j (0 .. $#AA) {print "\t$AA[$j]";} 
print "\tsize\n";

$IN=$ARGV[0];
open(IN, "$IN");

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

if (m/^>/) {s/>//g; @y=split(/\s+/,$_); $seqname=$y[0];} #if
   
}#while

close (IN);

## impr de la ligne des totaux en AA

$x=substr($IN,1,4);
$proteome=$x;

print "$proteome";

foreach $aa (0 .. $#AA) {
                         print "\t$count{$AA[$aa]}";
                          $size=$size + $count{$AA[$aa]};
                         }

print "\t$size\n";
         
## calcul des %
print "$proteome";
$tot=0;
foreach $aa (0 .. $#AA)
{

    $x=$count{$AA[$aa]}/$size *100;
    @tab=split(/[\.]/, $x);
    $z=substr($tab[1], 0, 2);
    $P="$tab[0]".".$z";
    print "\t$P";
    $tot=$tot + $P;
}
print "\t$tot\n";
