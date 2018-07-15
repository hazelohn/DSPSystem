`timescale 10ns / 1ps
module subSum(P7,P6,P5,P4,P3,P2,P1,P0,P);
input[17:0] P7,P6,P5,P4,P3,P2,P1,P0;
output[31:0] P;
wire[19:0] P01,P23,P45,P67;
Naddr #(.N(20)) Naddr0(.a({P0[17],P0[17],P0}),.b({P1,2'b0}),.s(P01),.ci(1'b0),.co());
Naddr #(.N(20)) Naddr1(.a({P2[17],P2[17],P2}),.b({P3,2'b0}),.s(P23),.ci(1'b0),.co());
Naddr #(.N(20)) Naddr2(.a({P4[17],P4[17],P4}),.b({P5,2'b0}),.s(P45),.ci(1'b0),.co());
Naddr #(.N(20)) Naddr3(.a({P6[17],P6[17],P6}),.b({P7,2'b0}),.s(P67),.ci(1'b0),.co());
wire[23:0] P0123,P4567;

Naddr #(.N(24)) Naddr4(.a({P01[19],P01[19],P01[19],P01[19],P01}),.b({P23,4'b0}),.s(P0123),.ci(1'b0),.co());
Naddr #(.N(24)) Naddr5(.a({P45[19],P45[19],P45[19],P45[19],P45}),.b({P67,4'b0}),.s(P4567),.ci(1'b0),.co());

Naddr #(.N(32)) Naddr6(.a({{8{P0123[23]}},P0123}),.b({P4567,8'b0}),.s(P),.ci(1'b0),.co());

endmodule