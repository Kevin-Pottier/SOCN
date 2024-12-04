$NF=$ARGV[0];
#print $NF."\n";
$hex=`cat $NF.hex`;
$tmp=`cat $NF.hex.tmp`;


#print "coucou\n";
while ($hex=~ s/\n\+\s(\w\w\w\w)\/(.*?)\n/\n/) {
#print "ouhouh\n";
$ad=$1;
$code=$2;

$tmp=~ s/\n\+\s$ad\/(.*?)\n/\n/;
print "$ad\t\/$code\t\t$1\n";
}
