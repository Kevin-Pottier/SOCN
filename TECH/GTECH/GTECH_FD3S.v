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


module GTECH_FD3S (D, CP, TI, TE, CD, SD, Q, QN); 
	input D, CP, CD, SD, TI, TE;
	output Q, QN;

	reg Q, QN;
	
        always @(posedge CP or negedge CD or negedge SD)
        begin
	    if (!CD ) begin
		if (!SD) begin
		    Q  = 1'b0;
		    QN = 1'b0;
		end
		else begin
		    Q  = 1'b0;
		    QN = 1'b1;
		end	
	    end
	    else if  (!SD) begin
		Q  = 1'b1;
		QN = 1'b0;
	    end
	    else 
	    begin
		if (TE)
	    	begin
		    Q = TI;
		    QN = ~TI;
		end
	    	else
	    	begin
                    Q  = D;
		    QN = ~D;
		end
	    end
        end
endmodule



