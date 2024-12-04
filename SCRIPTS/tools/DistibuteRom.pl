$cible=$ARGV[0];

@a=`cat $cible`;

$cpt=0;
$rom0="";
$rom1="";
$rom2="";
$rom3="";
foreach $el (@a) {

  $toto=$cpt % 4;

 if(($cpt % 4) == 0) {
  $rom0="$rom0$el"; 
 } elsif (($cpt % 4) == 1) {
  $rom1="$rom1$el";  
 } elsif (($cpt % 4) == 2) {
  $rom2="$rom2$el"; 
 } else {
  $rom3="$rom3$el"; 
 }

 $cpt++;
}

open(FRom0,"> rom0_i.txt");
print FRom0 $rom0;
close FRom0;

open(FRom1,"> rom1_i.txt");
printf FRom1 $rom1;
close FRom1;

open(FRom2,"> rom2_i.txt");
printf FRom2 $rom2;
close FRom2;

open(FRom3,"> rom3_i.txt");
printf FRom3 $rom3;
close FRom3;
