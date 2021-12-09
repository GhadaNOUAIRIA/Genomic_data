#!/usr/bin/perl
# usage of clustalw filename output format
$IN1=$ARGV[0];
$IN2=$ARGV[1];

system ("clustalw -infile=$IN1 -align -output=$IN2 -outfile=$IN1.$IN2 2>&1 > /dev/null");

