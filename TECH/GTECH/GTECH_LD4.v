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


module GTECH_LD4 (D, GN, CD, Q, QN); 
	input D, GN, CD;
	output Q, QN;

	reg Q, QN;


	always @(Q)
        begin
                QN = ~Q;
        end

        always @(GN or D or CD)
        begin
	    if (!CD) Q = 0;
	    else 
  	    begin
            	if (!GN) 
		    Q = D;
		
	    end
        end
endmodule



