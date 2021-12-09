#!/usr/bin/perl
$OF= $ARGV[0];

@list = `ls *.pep`;
while ($P = shift (@list))
{chomp $P;
    system ("clust.pl $P $OF");
}#while
