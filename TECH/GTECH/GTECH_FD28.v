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

module GTECH_FD28 (D0, D1, D2, D3, D4, D5, D6, D7, CP, CD, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, QN0, QN1, QN2, QN3, QN4, QN5, QN6, QN7);
  input D0, D1, D2, D3, D4, D5, D6, D7, CP, CD;
  output Q0, Q1, Q2, Q3,Q4, Q5, Q6, Q7, QN0, QN1, QN2, QN3, QN4, QN5, QN6, QN7;
  reg Q0, Q1, Q2, Q3,Q4, Q5, Q6, Q7;

    assign  QN0 = ~Q0;
    assign  QN1 = ~Q1;
    assign  QN2 = ~Q2;
    assign  QN3 = ~Q3;
    assign  QN4 = ~Q4;
    assign  QN5 = ~Q5;
    assign  QN6 = ~Q6;
    assign  QN7 = ~Q7;

        always @(posedge CP or negedge CD)
        begin
            if (!CD)
               begin
                Q0 <= 1'b0;
                Q1 <= 1'b0;
                Q2 <= 1'b0;
                Q3 <= 1'b0;
                Q4 <= 1'b0;
                Q5 <= 1'b0;
                Q6 <= 1'b0;
                Q7 <= 1'b0;
               end
            else
               begin
                Q0 <= D0;
                Q1 <= D1;
                Q2 <= D2;
                Q3 <= D3;
                Q4 <= D4;
                Q5 <= D5;
                Q6 <= D6;
                Q7 <= D7;
               end
        end
endmodule

