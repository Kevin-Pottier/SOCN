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



module GTECH_MUX4 (D0, D1, D2, D3, A, B, Z); 
	input D0, D1, D2, D3, A, B;
	output Z;
	assign Z = B ? (A ? D3 : D2) : (A ? D1 : D0);
endmodule

