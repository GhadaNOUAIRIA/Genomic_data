#!/usr/bin/perl

#usage:blp.pl Query_species_code Subject_species_code

$Q=@ARGV[0]; #query species code
$H=@ARGV[1]; #subject db

$temp=$Q;
$temp =~ tr/A-Z/a-z/;
$q=$temp;

$temp=$H;
$temp =~ tr/A-Z/a-z/;
$h=$temp;

$DB="/home/bcgaipt201723/home0/blastdb"; #path to db directory
$RES="/home/bcgaipt201723/home0/genanal/genomes"; # path to result directory

#print "Q=$Q\n";
$DIRQ="$RES"."/"."$Q";
#print "DIRQ=$DIRQ\n";
if ( !(-e $DIRQ))  { system ("mkdir $DIRQ");}

$DIRH="$RES"."/"."$Q"."/"."$H"."seqnew";
#print "DIRH=$DIRH\n";
if ( !(-e $DIRH)) { system ("mkdir $DIRH");}

$DIRresblp="$RES"."/"."$Q"."/"."$H"."resblp";
#print "DIRresblp= $DIRresblp\n";
if ( !(-e $DIRresblp)) { system ("mkdir $DIRresblp");}

#print "q=$q\n";
$ALL = "all"."$q"."prt.fasta"; 
#print "ALL=$ALL\n";


@SEQ=`ls $DB/$ALL`;

while ($S= shift @SEQ)
    {
     chomp $S;
# print "S=$S\n";
     $seq="$DB"."/"."$ALL"."/"."$S";
# print "seq=$seq\n";
     system ("cp $seq .");
     $PEP="G"."$H".".pep";
     system ("blastp -query $S -db $DB/$PEP -evalue 1.e-9 -seg yes -out $S.blp");
     system ("blastp -query $S -db $DB/$PEP -evalue 1.e-9 -seg yes -outfmt 6 -out $S.blp6");

# print "DIRresblp=$DIRresblp\n";

     
     system ("mv $S.blp $DIRresblp");
    
     $all="$DIRH"."/"."all"."$q"."$h";
# print "all=$all\n";
     system ("cat $S.blp6 >> $all");
     system ("rm $S.blp6 $S");
}
