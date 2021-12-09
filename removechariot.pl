#!/usr/bin/perl

#script to remove \n from a file

$IN = @ARGV[0];


open (IN, "$IN");
if ($IN eq "") {print "Usage: removechariot.pl filename"; exit;};

while (<IN>)
{ if (!m/^>/) {chomp $_;
	       print $_;}

else {print "\n"; 
print $_;
}
}

  close (IN);
