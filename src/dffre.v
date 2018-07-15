module dffre(d,en,r,clk,q);
parameter WIDTH = 1;
input en,r,clk;
input[WIDTH-1:0] d;
output reg[WIDTH-1:0] q;

always @(posedge clk)
begin
	if(r) q = {WIDTH{1'b0}};
	else if(en) q=d;
	else q = q;
end

endmodule