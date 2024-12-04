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


module GTECH_INOUTBUF (DATA_OUT, OE, PAD_INOUT, DATA_IN);  
	input DATA_OUT, OE;
	output DATA_IN;
	inout PAD_INOUT;

        bufif1 u0 (PAD_INOUT, DATA_OUT, OE);
        buf u1 (DATA_IN, PAD_INOUT);

endmodule



