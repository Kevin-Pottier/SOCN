//-------------------------------------------------------------------------
// ﾩ 1997-2005 Cadence Design Systems, Inc.  All rights reserved.
// This work may not be copied, modified, re-published, uploaded, executed,
// or distributed in any way, in any medium, whether in whole or in part,
// without prior written permission from Cadence Design Systems, Inc.
//------------------------------------------------------------------------

//------------------------------------------------------------------------
//  Abstract   : Simulation Architecture for v06
//  RC Release : v06.20-s026_1
//------------------------------------------------------------------------

module GTECH_FJK1S (J, K, TI, TE, CP, Q, QN);
   input J, K, CP, TI, TE;
   output Q, QN;
   reg 	  Q;

   assign QN = ~Q;

   always @(posedge CP)
     begin
       if (TE)
	 Q = TI;
       else
	 case ({J,K}) 
	   2'b00: Q = Q;
	   2'b01: Q = 1'b0;
	   2'b10: Q = 1'b1;
	   2'b11: Q = ~Q;
	 endcase
     end

endmodule



    
  