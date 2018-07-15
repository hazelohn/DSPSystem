`timescale 10ns / 1ps
module boothEncode(A,d);
input[2:0] A;
output reg[2:0] d;
always @(*)
begin
	case(A)
		3'B000: d = 3'b000;
		3'B001: d = 3'b001;
		3'B010: d = 3'b001;
		3'B011: d = 3'b010;
		3'B100: d = 3'b110;
		3'B101: d = 3'b111;
		3'B110: d = 3'b111;
		3'B111: d = 3'b000;
	endcase
end

endmodule