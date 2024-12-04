#!/usr/bin/perl

@fic=`cat $ARGV[0]`;

foreach $el (@fic) {
$el=~ /(\w)(\w)/;

$el1 = $1;
$el2 = $2;


if ($el1 eq "0") { $bin1="0000"}
elsif ($el1 eq "1") { $bin1="0001"}
elsif ($el1 eq "2") { $bin1="0010"}
elsif ($el1 eq "3") { $bin1="0011"}
elsif ($el1 eq "4") { $bin1="0100"}
elsif ($el1 eq "5") { $bin1="0101"}
elsif ($el1 eq "6") { $bin1="0110"}
elsif ($el1 eq "7") { $bin1="0111"}
elsif ($el1 eq "8") { $bin1="1000"}
elsif ($el1 eq "9") { $bin1="1001"}
elsif (($el1 eq "a") or ($el1 eq "A")) { $bin1="1010"}
elsif (($el1 eq "b") or ($el1 eq "B")) { $bin1="1011"}
elsif (($el1 eq "c") or ($el1 eq "C")) { $bin1="1100"}
elsif (($el1 eq "d") or ($el1 eq "D")) { $bin1="1101"}
elsif (($el1 eq "e") or ($el1 eq "E")) { $bin1="1110"}
elsif (($el1 eq "f") or ($el1 eq "F")) { $bin1="1111"} ;

if ($el2 eq "0") { $bin2="0000"}
elsif ($el2 eq "1") { $bin2="0001"}
elsif ($el2 eq "2") { $bin2="0010"}
elsif ($el2 eq "3") { $bin2="0011"}
elsif ($el2 eq "4") { $bin2="0100"}
elsif ($el2 eq "5") { $bin2="0101"}
elsif ($el2 eq "6") { $bin2="0110"}
elsif ($el2 eq "7") { $bin2="0111"}
elsif ($el2 eq "8") { $bin2="1000"}
elsif ($el2 eq "9") { $bin2="1001"}
elsif (($el2 eq "a") or ($el2 eq "A")) { $bin2="1010"}
elsif (($el2 eq "b") or ($el2 eq "B")) { $bin2="1011"}
elsif (($el2 eq "c") or ($el2 eq "C")) { $bin2="1100"}
elsif (($el2 eq "d") or ($el2 eq "D")) { $bin2="1101"}
elsif (($el2 eq "e") or ($el2 eq "E")) { $bin2="1110"}
elsif (($el2 eq "f") or ($el2 eq "F")) { $bin2="1111"} ;



print $bin1;
print $bin2."\n";
}
