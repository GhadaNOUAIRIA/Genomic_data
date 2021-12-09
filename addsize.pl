#!/usr/bin/perl
#usage addsize sacecagl.rbh SACEseqsize.tab CAGLseqsize.tab 

open (B, "caglsace.rbh");
open (J, "SACEseqsize.tab");
open (I, "CAGLseqsize.tab");

while (<I>)
{ 
@tab=split(/\s+/,$_);

$S1{$tab[0]}=$tab[1];

}
close (I);

while (<J>)
{
    @tab=split(/\s+/,$_);
    $S2{$tab[0]}=$tab[1];
}
close (J);

while (<B>)
{
    @tab=split(/\s+/,$_);
    print "$tab[0]\t$S1{$tab[0]}\t$tab[1]\t$S2{$tab[1]}\n";
    
}
close (B);
 
