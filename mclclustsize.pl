#!/usr/bin/perl

# mcl_cluster 
#out clusters with their corresponding sizes.
#use mclclustsize.pl test.clusters_tribe > test.mclclusters


$IN=@ARGV[0]; # file of cluster as obtaines by tribe_families.

system(`cat $IN | nom.pl | sort -n -u > NN`);

open (I , "NN" ) || die "can't open NN ";
while(<I>)
{
    @tab=split(/\s+/, $_ );

system(`grep -w "^$tab[0]" $IN > TEMP`);

        @NTAB=split(/\s+/, `cat TEMP | wc -l`);
	$size=$NTAB[0];

#        print "I=$tab[0]\tsize=$size\n\n";

    open(T, "TEMP") || die "can't open TEMP";
    while(<T>)
    {
	@TAB=split(/\s+/, $_ );
	print "C$size."; print "$TAB[0]\t$size\t$TAB[1]\n";
    }
    close(T);

}
close(I);
system("rm TEMP NN ");
