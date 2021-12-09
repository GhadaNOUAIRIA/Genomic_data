#!/usr/bin/perl

# Frequency of each codon in a sequence database in a fasta format.
# Use : codoncont.pl db > outfile
# FT  28/01/97
#---------------------------------

@L_CODONS=('TTT','TTC','TTA','TTG',
           'CTT','CTC','CTA','CTG',
           'ATT','ATC','ATA','ATG',
           'GTT','GTC','GTA','GTG',

           'TCT','TCC','TCA','TCG',
           'CCT','CCC','CCA','CCG',
           'ACT','ACC','ACA','ACG',
           'GCT','GCC','GCA','GCG',

           'TAT','TAC',
           'CAT','CAC','CAA','CAG',
           'AAT','AAC','AAA','AAG',
           'GAT','GAC','GAA','GAG',

           'TGT','TGC',      'TGG',
           'CGT','CGC','CGA','CGG',
           'AGT','AGC','AGA','AGG',
           'GGT','GGC','GGA','GGG');

@l_codons=('ttt','ttc','tta','ttg',
           'ctt','ctc','cta','ctg',
           'att','atc','ata','atg',
           'gtt','gtc','gta','gtg',

           'tct','tcc','tca','tcg',
           'cct','ccc','cca','ccg',
           'act','acc','aca','acg',
           'gct','gcc','gca','gcg',

           'tat','tac',
           'cat','cac','caa','cag',
           'aat','aac','aaa','aag',
           'gat','gac','gaa','gag',

           'tgt','tgc',     'tgg',
           'cgt','cgc','cga','cgg',
           'agt','agc','aga','agg',
           'ggt','ggc','gga','ggg');



#------------------------------------
$naa = 61; # number of codons
$totaa=0;
$k=0;
while($k<=$naa) { $FAA[$k]=0; $k++ ;}
$flag=0;
$F=@ARGV[0];

$nom="   ";
#print column names
       $k=0;
            print "ORF"; 
            while( $k < $naa - 1)
            {
	    print "\t"; print $L_CODONS[$k];$k++;
	    }
	    print "\n";

open(F,"$F") || die "Can't open $!\n";

while(<F>)
{
    if ( m />/ ) 
       { 

	   if ( $flag > 0 )
           {
#print frequency of previous record

#print "$A\n";

    $lA = length($A); # sequence length

     $L=$lA;
     $i=0;
     while ( $i <= $L -1 )
     {

	 $aa = substr($A,$i,3);
	 $iflag=0;
	 $k=0;
#print " $aa";	                                  
         while ( $k <= $naa - 1)
         {
            if ( $aa eq $L_CODONS[$k] || $aa eq $l_codons[$k] )
            {
		$FAA[$k]++;
		$totaa++;
		$k=$naa;
		$iflag = 1;
	    }
	    $k++;
	 }#while($k)

#         if ( $iflag == 0 && $aa ne "\n" ) { print "$aa not counted\n"; }

	 $i = $i +3;
     }#while($i)


            $k=0;
            chop; print $nom; 
	    while ($k < $naa - 1) { print "\t"; print $FAA[$k];$k++;}
            print "\n";  
#	    print "\t"; print $totaa; print "\n";
	    }
$k=0;
while($k<=$naa - 1) { $FAA[$k]=0; $k++ ;}
	   $totaa=0;
	   @SEQ="";
	   @A="";
	   $LSEQ=0;

#new record
         @tab=split(/\s+/, $_); 

	 $N=length($tab[0]);
         $j=0;
         $nom="";
         while($j < $N) { $car=substr($tab[0],$j,1);
                            if ( $j > 0 ) { $nom=$nom.$car; } $j++;
			  }
###       print "$nom\n";
	   $flag=1;
       } #if m 

 if( ! m/>/)
 {
#---------- put the sequence in one line
     @tab=split(/\s+/, $_);
     push(@SEQ, pop(@tab)); $LSEQ=$LSEQ+length($_);
     $A = join("",@SEQ); #whole sequence
#--
 } # if !m 



} #while(<F>)


#print frequency of last record

    $lA = length($A); # sequence length

     $L=$lA;
     $i=0;
     while ( $i <= $L -1 )
     {

	 $aa = substr($A,$i,3);
	 $iflag=0;
	 $k=0;
#print " $aa";	                                  
         while ( $k <= $naa - 1)
         {
            if ( $aa eq $L_CODONS[$k] || $aa eq $l_codons[$k] )
            {
		$FAA[$k]++;
		$totaa++;
		$k=$naa;
		$iflag = 1;
	    }
	    $k++;
	 }#while($k)

#         if ( $iflag == 0 && $aa ne "\n" ) { print "$aa not counted\n"; }

	 $i = $i +3;
     }#while($i)


#print frequency of previous record
	       $k=0;
            chop; print $nom; 
            while($k < $naa - 1)
            {
	    print "\t"; print $FAA[$k];$k++;
#	    print "\t"; print $totaa; print "\n";
	    }
	    print "\n";
