module SelTWtoO(selQ,sel,x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23
,x24,x25,x26,x27,x28,x29,x30,x31);

input[4:0] sel;
input[15:0] x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23
,x24,x25,x26,x27,x28,x29,x30,x31;
output reg[15:0] selQ;

always @(*)
begin
	case(sel)
		5'b00000: selQ = x0;
		5'b00001: selQ = x1;
		5'b00010: selQ = x2;
		5'b00011: selQ = x3;
		5'b00100: selQ = x4;
		5'b00101: selQ = x5;
		5'b00110: selQ = x6;
		5'b00111: selQ = x7;
		5'b01000: selQ = x8;
		5'b01001: selQ = x9;
		5'b01010: selQ = x10;
		5'b01011: selQ = x11;
		5'b01100: selQ = x12;
		5'b01101: selQ = x13;
		5'b01110: selQ = x14;
		5'b01111: selQ = x15;
		5'b10000: selQ = x16;
		5'b10001: selQ = x17;
		5'b10010: selQ = x18;
		5'b10011: selQ = x19;
		5'b10100: selQ = x20;
		5'b10101: selQ = x21;
		5'b10110: selQ = x22;
		5'b10111: selQ = x23;
		5'b11000: selQ = x24;
		5'b11001: selQ = x25;
		5'b11010: selQ = x26;
		5'b11011: selQ = x27;
		5'b11100: selQ = x28;
		5'b11101: selQ = x29;
		5'b11110: selQ = x30;
		5'b11111: selQ = x31;
		
	endcase
end

endmodule