#!/usr/bin/perl

$cible=$ARGV[0];

@a=`cat $cible`;
$res="";

foreach $el (@a) {
$el=~ s/\n//;

$res=$res.bin2hex($el);
}

if (length($res) % 4 == '1') {
 $res=$res."000000";
} elsif (length($res) % 4 == '2') {
 $res=$res."0000";
} elsif (length($res) % 4 == '3') {
 $res=$res."00";
}

while($res=~ s/^(\w\w\w\w)//) {
 print $1."\n";
}

for ($i=0; $i<16000;$i++) {
 print "0000\n";
}

sub bin2hex {
 my $el=shift(@_);

 $el=~ /(\d)(\d)(\d)(\d)(\d)(\d)(\d)(\d)/;
 $dec=$1*128+$2*64+$3*32+$4*16+$5*8+$6*4+$7*2+$8;
 $hexa=sprintf ("%X", $dec);
 if (length($hexa) == 1) {
  return "0".$hexa;
 } else {
  return $hexa;
 }

}
