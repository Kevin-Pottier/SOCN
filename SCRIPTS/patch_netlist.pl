open(NETLIST, $ARGV[0] ) or die "Can't open file $ARGV[0]";

#  InternalRom16_2187 rom1(.RomClk (DaxDplXRamClk), .RomMe (Rom0Me),

my %mod2inst = ();

#---------------------------------------------------
# PASS1:
# Mapping rom uniquified module to rom instance
#---------------------------------------------------

while ( my $line = <NETLIST> ) {

   if($line=~ /^\s*(InternalRom1([^\s]+))\s+rom(\d)\s*\(/o) {

     $module=$1;
     $instance_id=$3;
     
     print STDERR "-I- patch_netlist.pl <PASS1>: rom instance $instance_id of module $module found ...\n";
     $mod2inst{$module} = $instance_id;
   }
 


}
close(NETLIST);

#---------------------------------------------------
# PASS2:
# searching modules to apply patch
#---------------------------------------------------

open(NETLIST, $ARGV[0] ) or die "Can't open file $ARGV[0]";
my $SM = "idle";

while ( my $line = <NETLIST> ) {

#module InternalRom16(RomClk, RomMe, PRaddress, DataOut);

 if ( $SM eq "idle" ) {        

   if($line=~ /^\s*module\s+(InternalRom1([^\s]+))\s*\(/o) {
   
     $module=$1;

     if(exists $mod2inst{$module}) {
       print STDERR "-I- patch_netlist.pl <PASS2>: module $module found ...\n";
       $SM = "dirom";
     }
   }
   print $line;

 } elsif ( $SM eq "dirom" ) {        
#  dirom32768x8 rom_i(.CS (CS), .AD ({2'b00, PRaddress}), .EN (1'b0),

   if($line=~ /(^\s*dirom32768x8\s)(rom_i.*)/o) {
     $first=$1;
     $last=$2;
     
     print $first."\n";
     print "	#(.DATA_FILE(\"rom".$mod2inst{$module}."_i.txt\"))\n";
     print $last."\n";

     $SM = "idle";
     next;

   } elsif ($line=~ /endmodule/o) {
       print STDERR "-E- patch_netlist.pl: unexpected endmodule found, no dirom32768x8 instance was found ...\n";
       exit -1;
   } else {
     print $line;
   }
 
 }


}

print STDERR "-I- patch_netlist.pl: end\n";
close(NETLIST);
exit;

