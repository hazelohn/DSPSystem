`timescale 10ns / 1ps
module subMultiply(B,d,P);
input[15:0] B;
input[2:0] d;
output reg[17:0] P;

always @(*)
begin
	case(d)
		3'b000: P = 18'b0; 
		3'b001: P = {B[15],B[15],B};
		3'b010: begin
			P = {B[15],B[15],B}<<1;
		end
		3'b110:begin
			P = ((~{B[15],B[15],B})+1)<<1;
		end
		3'b111:begin
			P = (~{B[15],B[15],B})+1;
		end
	endcase
end


endmodule