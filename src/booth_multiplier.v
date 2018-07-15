`timescale 10ns / 1ps

module booth_multiplier(A,B,P);
	input[15:0] A,B;
	output[31:0] P;

	wire[2:0] d0,d1,d2,d3,d4,d5,d6,d7;

	boothEncode boothEncode0(.A({A[1],A[0],1'b0}),.d(d0));
	boothEncode boothEncode1(.A({A[3],A[2],A[1]}),.d(d1));
	boothEncode boothEncode2(.A({A[5],A[4],A[3]}),.d(d2));
	boothEncode boothEncode3(.A({A[7],A[6],A[5]}),.d(d3));
	boothEncode boothEncode4(.A({A[9],A[8],A[7]}),.d(d4));
	boothEncode boothEncode5(.A({A[11],A[10],A[9]}),.d(d5));
	boothEncode boothEncode6(.A({A[13],A[12],A[11]}),.d(d6));
	boothEncode boothEncode7(.A({A[15],A[14],A[13]}),.d(d7));

	wire[17:0] P7,P6,P5,P4,P3,P2,P1,P0;
	subMultiply subMultiply0(.B(B),.d(d0),.P(P0));
	subMultiply subMultiply1(.B(B),.d(d1),.P(P1));
	subMultiply subMultiply2(.B(B),.d(d2),.P(P2));
	subMultiply subMultiply3(.B(B),.d(d3),.P(P3));
	subMultiply subMultiply4(.B(B),.d(d4),.P(P4));
	subMultiply subMultiply5(.B(B),.d(d5),.P(P5));
	subMultiply subMultiply6(.B(B),.d(d6),.P(P6));
	subMultiply subMultiply7(.B(B),.d(d7),.P(P7));

	subSum subSum0(.P7(P7),.P6(P6),.P5(P5),.P4(P4),.P3(P3),.P2(P2),.P1(P1),.P0(P0),.P(P));

endmodule