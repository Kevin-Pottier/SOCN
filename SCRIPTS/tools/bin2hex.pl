#!/usr/bin/perl

@fic=`cat $ARGV[0]`;

foreach $el (@fic) {
$el=~ /(\d)(\d)(\d)(\d)(\d)(\d)(\d)(\d)/;
$dec=$1*128+$2*64+$3*32+$4*16+$5*8+$6*4+$7*2+$8;
$hexa=sprintf ("%X", $dec);
 if (length($hexa) == 1) {
  print "0".$hexa."\n";
 } else {
  print $hexa."\n";
 }
}

