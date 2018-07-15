module smoothController(stage1,smooth,sys_clk,reset,ready,FactorSel,SClr,OutEn,AddrSel);
input stage1,smooth,sys_clk,reset,ready;
output reg FactorSel,SClr,OutEn,AddrSel;

parameter RESET = 0,SampleAddCount=1,LoadData2=2,MAC1 = 3,MAC2 = 4,OutData = 5;
reg[2:0] state,nextstate;

always @(posedge sys_clk)
begin
	if(reset) state = RESET;
	else state = nextstate;
end

always @(*)
begin
	FactorSel = 0;
	SClr = 0;
	OutEn = 0;
	AddrSel = 0;
	case(state)
		RESET: begin
			SClr =0 ;
			AddrSel = 0 ;
			FactorSel = 0;
			OutEn = 0;
			if(ready)begin
				nextstate = SampleAddCount;
			end
			else begin
				nextstate = RESET;
			end
		end
		SampleAddCount:begin
			SClr = 0;
			AddrSel =0;
			FactorSel =0;
			OutEn = 0;
			if(stage1) nextstate = OutData;
			else nextstate = LoadData2;
		end
		LoadData2: begin
			SClr = 1;
			AddrSel = 1;
			FactorSel = 0;
			OutEn = 0;
			if(smooth) nextstate = MAC1;
			else nextstate = OutData;

		end
		MAC1: begin
			SClr = 0;
			AddrSel = 0;
			FactorSel = 1;
			OutEn = 0;
			nextstate = MAC2;
		end
		MAC2:begin
			SClr = 0;
			AddrSel = 0;
			FactorSel = 0;
			OutEn = 0;
			nextstate = OutData;
		end
		OutData: begin
			SClr = 0;
			AddrSel = 0;
			FactorSel = 0;
			OutEn = 1;
			nextstate =RESET;
		end
		default: nextstate = RESET;

	endcase
end

endmodule