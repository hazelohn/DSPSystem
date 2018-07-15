module counterT(clk,en,r,q,co);

parameter n=2;
parameter counter_bits = 1;
input clk,en,r;
output reg[counter_bits:1] q;
output co;
assign co = (q==(n-1))&&en;

always @(posedge clk)
begin
	if(r) q=0;
	else if(en)
	begin
		if(q==(n-1)) q=0;
		else q=q+1;
	end
	else q=q;
end

endmodule