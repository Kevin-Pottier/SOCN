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

module GTECH_LSR0(S,R,Q,QN);

    input S,R;
    output Q,QN;

    reg Q;

    assign QN = (!R & !S) ? Q : ~Q;

    always @ (S or R)
    begin
      if (!R)    
        Q = 1'b0; 
      else if (!S) 
        Q = 1'b1;
    end
endmodule 
