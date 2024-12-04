#$mynl=`cat $ARGV[0]`;

open(MYFILE, "$ARGV[0]");

while($l=<MYFILE>) {
 $l=~ s/\([\s\d\.]*:[\s\d\.]*:([^\)]+)\)/\($1:$1:$1\)/g;
 print $l;
}
