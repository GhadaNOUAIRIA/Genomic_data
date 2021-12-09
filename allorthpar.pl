#!/usr/bin/perl
#usage: allorthpar.pl xx.paralogs yy.paralogs zz.paralogs ORTH.mclclusters > sfamORTH-MCL

$xx=@ARGV[0]; #||die...
$yy=@ARGV[1];
$zz=@ARGV[2];
$ORTH=@ARGV[3];

open (x, "$xx");
while (<x>)
{
    @tab=split(/\s+/,$_);
    $SACEPAR{$tab[0]}=$tab[1];

}#whilex
close (x);

open (y, "$yy");
while (<y>)
{
    @tab=split(/\s+/,$_);
    $CAGLPAR{$tab[0]}=$tab[1];
}#whiley
close (y);

open (z, "$zz");
while (<z>)
{
    @tab=split(/\s+/,$_);
    $ZYROPAR{$tab[0]}=$tab[1];
}#whilez
close (z);

open (O, "$ORTH");
while (<O>)
{
    chomp $_;
    @tab=split(/\s+/,$_);
   
    print "$tab[2]\t";
    if ($SACEPAR{$tab[2]}) {print "$SACEPAR{$tab[2]}\t";}
    if ($CAGLPAR{$tab[2]}) {print "$CAGLPAR{$tab[2]}\t";}
    if ($ZYROPAR{$tab[2]}) {print "$ZYROPAR{$tab[2]}\t";}
    print "$tab[0]\n";
    
}#whileO
close (O);

