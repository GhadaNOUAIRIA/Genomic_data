#!/usr/bin/perl

#usage: printnshits.pl XX.ident bestxxyy.HS (orphans sequences)

$ID=@ARGV[0];
$BEST=@ARGV[1];

open (BEST, "$BEST");

while (<BEST>)
    {
    @tab= split (/\s+/, $_);
    
    $Bname{$tab[0]}=$_;
    
      }#while
close(BEST);

open (ID, "$ID");
$V=$BEST;
$V=~ s/HS/NS/;
open (OUT, ">$V");
    
while (<ID>)
{
    @tab= split (/\s+/, $_);

    if ($Bname{$tab[0]}) {next;}
    print OUT $_;
}
close (ID);
close (OUT);
