#!/usr/bin/perl

#Se mettre dans le directory GEN/GENseqnew/
#usage: mcl.scr GENCODE
#FT 15-sept 2007

$GEN    =@ARGV[0];  #new genome code
if ( $GEN eq "" || $GEN eq "-h" ) 
      { print "\nUsage: mcl.scr genome_code \n\n";
        exit(0);
      }

$temp=$GEN;
$GEN =~ tr/A-Z/a-z/;
$gen=$GEN;
$GEN=$temp;

#Path directory
$PD="/home0/genanal/genomes";

#I- construct MCL clusters from nonumique proteins
#create the directory

$DIRSN=$PD."/".$GEN."/".$GEN."seqnew";
$DIRMCL=$PD."/".$GEN."/".$GEN."seqnew"."/"."MCL";
print "DIR=$DIRMCL\n";
unless (-e $DIRMCL) { system ("mkdir $DIRMCL")};


##mkdir MCL
#cd MCL
system("cd $DIRMCL");
$g="all".$gen."seqnew.HS";
#system("ln -s $DIRSN/all$genseqnew.HS $DIRMCL/all$genseqnew.HS");
system("ln -s $DIRSN/$g $DIRMCL/$g");

#0- sort -n -k 2 -r ../freqorfxx.xx | nom.pl > nomorf

system("sort -n -k 2 -r $DIRSN/freqorf$gen.$gen | nom.pl > $DIRMCL/nomorf" );

#1- mcltabform.pl nomorf > XX.tab

system("mcltabform.pl $DIRMCL/nomorf > $DIRMCL/$GEN.tab");

#2- mclall2num.pl XX.tab allxxseqnew.HS > allxxnum

$gn="all".$gen."num";
#system(" mclall2num.pl $DIRMCL/$GEN.tab $DIRSN/all$genseqnew.HS > $DIRMCL/all$gennum");
system(" mclall2num.pl $DIRMCL/$GEN.tab $DIRSN/$g > $DIRMCL/$gn");

#3- mclall2cmi.pl allxxnum XX.tab &  (output allxxnum.cmi )

#system(" mclall2cmi.pl $DIRMCL/all$gennum $DIRMCL/$GEN.tab");
system(" mclall2cmi.pl $DIRMCL/$gn $DIRMCL/$GEN.tab");

#4- mcl allxxnum.cmi -I 3.0 -progress 100 -o XX.clusters &  (clustering)
# (change -I 2.5 for example, if MCL clsuters sizes are greater than partition size)

$gncmi=$gn.".cmi";
#system("mcl $DIRMCL/all$gennum.cmi -I 3.0 -progress 100 -o $DIRMCL/$GEN.clusters");
system("mcl $DIRMCL/$gncmi -I 3.0 -progress 100 -o $DIRMCL/$GEN.clusters");

#5- mcltribefamilies.pl XX.clusters XX.tab > XX.clusters-tribe &
system("mcltribefamilies.pl $DIRMCL/$GEN.clusters $DIRMCL/$GEN.tab > $DIRMCL/$GEN.clusters-tribe");


#6- mclclustsize.pl XX.clusters-tribe > XX.mclclusters &
system("mclclustsize.pl $DIRMCL/$GEN.clusters-tribe > $DIRMCL/$GEN.mclclusters");

#renumber classes in increasing order for each size
#7- renumclass.pl XX.mclclusters & 
system("renumclass.pl $DIRMCL/$GEN.mclclusters");

##II- Construct partitions for nonunique proteins

#cd ..
#mkdir families
$DIRFAM=$PD."/".$GEN."/".$GEN."seqnew"."/"."families";
print "DIR=$DIRFAM\n";
unless (-e $DIRFAM) { system ("mkdir $DIRFAM")};

#cd families
system("cd $DIRFAM");

#0- ln -s ../MCL/XX.tab
system("ln -s $DIRMCL/$GEN.tab $DIRFAM/$GEN.tab");

#1- ln -s ../MCL/allxxnum
#system("ln -s $DIRMCL/all$gennum $DIRFAM/all$gennum");
system("ln -s $DIRMCL/$gn $DIRFAM/$gn");

#2- cp ~/bin/partitions.scr .
#   and adapt (change species code).
#system('sed -e "s/ZYRO/$GEN/g" -e "s/zyro/$gen/g" /export/home/tekaia/bin/partitions.scr > $DIRFAM/partitions.scr');

system("parts.pl $DIRFAM/$GEN.tab $DIRFAM/$gn");
system("P.pl $DIRFAM/$GEN.tab $DIRFAM/$GEN.tab.parts $DIRFAM/$gn");
system("renumfam.scr $GEN");

system("mv FAMILIES $DIRFAM/");
system("mv sfam$GEN $DIRFAM/");
system("mv sfamsize.histo $DIRFAM/");

#3- nohup partitions.scr &   
#(this may take some time to terminate, depending on the size of allxxnum file).

#system("$DIRFAM/partitions.scr");

## renumfam.scr XX 


##III- compare MCL and partitions clustering

#0- cd ../MCL
system("cd $DIRMCL");


#1- ln -s ../families/sfamXX
system("ln -s $DIRFAM/sfam$GEN $DIRMCL/sfam$GEN");
#system("rm $DIRMCL/all$gennum.cmi $DIRMCL/$GEN.clusters $GEN.clusters-tribe");
system("rm $DIRMCL/$gncmi $DIRMCL/$GEN.clusters $DIRMCL/$GEN.clusters-tribe");

#(rm allxxnum.cmi XX.clusters XX.clusters-tribe)

#2- mclcompPC.pl sfamXX  XX.mclclusters > sfamXX-P-MCL &
system("mclcompPC.pl $DIRFAM/sfam$GEN $DIRMCL/$GEN.mclclusters > $DIRMCL/sfam$GEN-P-MCL");

#3- cat  sfamXX-P-MCL | mcljoin.pl > sfamXX-PMCL &
system("cat $DIRMCL/sfam$GEN-P-MCL | mcljoin.pl > $DIRMCL/sfam$GEN-PMCL");
system("rm $DIRMCL/sfam$GEN-P-MCL");


## IV- Multiple matches and conservation

#cd ..
#mkdir multmatchxx
$mm="multmatch".$gen;
$DIRMM=$DIRSN."/".$mm;
system("mkdir $DIRMM");

print "DIR=$DIRMM\n";

$sf="sfam".$GEN."-PMCL";
#ln -s ../MCL/sfamXX-PMCL
system("ln -s $DIRMCL/$sf $DIRMM/$sf");

#ln -s ../bestxxseqnew
$best="best".$gen."seqnew";
system("ln -s $DIRSN/$best $DIRMM/$best");

#grep ">" /home1/data/GXX.pep | sed -e "s/>//g" > kgenexx.comment
$genom="/home1/data/G".$GEN.".pep";
$kgc="kgene".$gen.".comment";
$kgf="kgene".$gen.".funct";
system(`grep ">" $genom | sed -e "s/>//g" > $DIRMM/ZZZ`);

open (K,"$DIRMM/ZZZ");
open (OUT,">$DIRMM/$kgc");
open (OUT1,">$DIRMM/$kgf");
while(<K>)
  {
   @tab=split(/\s+/, $_,2);

   print OUT "$tab[0]\t$tab[1]";
   print OUT1 "$tab[0]\t$tab[0]\n";

  }
system("rm $DIRMM/ZZZ");

close(OUT);
close(OUT1);

#tt.pl (make sure there a tab between the first and second column)

#extract kgenexx.funct.

#adapt the sripts : distribfamm.scr

#distribfamm.pl bestxxseqnew sfamXX-PMCL > XXfamm.list 
$MM=$GEN."famm.list";
$MMM=$GEN."fammm.list";
system("distribfamm.pl $DIRMM/$best $DIRMM/$sf > $DIRMM/$MM");

#addgenecomm.pl kgenexx.funct XXfamm.list > XXfammm.list
#system("addgenecomm.pl $DIRMM/$kgf $DIRMM/$MM > $DIRMM/$MMM");