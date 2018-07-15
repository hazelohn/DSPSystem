module firControl(sample,reset,co,clk,oe,clr);
input sample,reset,clk,co;
output reg clr,oe;

parameter RESET = 0,MAC= 1,DATAOUT=2;
reg[2:0] state,nextstate;

always @(posedge clk) if(reset) state = RESET;else state = nextstate;

always @(*)begin
	clr = 0;oe = 0;
	case(state)
		RESET :begin
			clr = 1;
			oe = 0;
			if(sample)
			begin
				nextstate = MAC;
			end
			else begin
				nextstate = reset;
			end
		end
		MAC: begin
			clr = 0;
			oe = 0;
			if(co) begin
				nextstate = DATAOUT;
			end
			else begin
				nextstate = MAC;
			end
		end
		DATAOUT : begin
			clr = 0;
			oe = 1;
			nextstate = RESET;
		end
	endcase
end

endmodule