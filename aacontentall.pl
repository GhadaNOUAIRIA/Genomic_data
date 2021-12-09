#!/usr/bin/perl

#counting aa
@AA=('A','R','N','D','C','Q','E','G','H','I','L','K','M','F','P','S','T','W','Y','V','B');
$IN=$ARGV[0];
$name=$IN;
$name=~ s/^G//;
$name=~ s/\.pep//;

open (IN, "$IN");


 print "Proteome";

    foreach $j (0 .. $#AA) {print"\t$AA[$j]";}

print "\tSize\n";

while (<IN>)
{
    if (!m/^>/)
    {	@tab=split('',$_);
	
	foreach $j (0 .. $#tab-1)	{ $count{$tab[$j]}++;}#fin foreach
	
    }#fin if
	
#### if (m/^>/) {s/>//g;
#####  @y=split(/\s+/,$_); $seqname=$y[0];}#fin if
    
  }#fin while

#### print "$seqname";
$size=0;
print "$name";
    foreach $aa (0 .. $#AA) {
                         print "\t$count{$AA[$aa]}";
			 $size += $count{$AA[$aa]}; }#foreach
print "\t$size";

print "\n";
print "\t";
foreach $aa1 (0..$#AA) {
   $P= $count{$AA[$aa1]}/$size *100;
        
@tab2=split(/\./, $P);

$k=substr($tab2[1],0,2);

   $Pourcent = "$tab2[0]".".$k";
   print "\t$Pourcent";
   $PS = $size/$size;
   
}
print "\t$PS";
print "\n";

 
    


close (IN);

	
