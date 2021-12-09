#!/usr/bin/perl
#usage clustall.pl Output format
$OF=@ARGV[0]; #output format
@LIST=`ls *.pep`;
while ($P=shift(@LIST))
{
    chomp $P;
    system ("clustg.pl $P $OF");
}
