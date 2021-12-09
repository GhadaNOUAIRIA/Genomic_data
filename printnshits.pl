#!/usr/bin/perl
#chooses orphan genes printnshits sp.ident bestspsp.HS

$ID = @ARGV[0];
$BEST = @ARGV[1];

open (BEST, $BEST);

while (<BEST>)   
{   @tab = split (/\s+/, $_);
    $Bname{$tab[0]} = $_ ;
}
close (BEST);

open (ID, $ID);
$N = $BEST;
$N =~ s/HS/NS/;
open (OUT, ">$N");

    while (<ID>)
{
@tab= split (/\s+/, $_);	
  if ($Bname{$tab[0]})   {next;}
    print OUT $_;
}
close (ID);
close (OUT);
