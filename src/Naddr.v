`timescale 10ns / 1ps
module Naddr(a,b,s,ci,co);
parameter N=8;
input[N-1:0] a;
input[N-1:0] b;
output[N-1:0] s;
input ci;
output co;
wire co;
integer i;
reg[N-1:0] s;
reg[N:0] c;

assign co = c[N];

always @(*)
begin
	c[0] = ci;
	for(i=0;i<=N-1;i=i+1)
	begin
		s[i] = a[i]^b[i]^c[i];
		c[i+1] = a[i]&&b[i]||a[i]&&c[i]||b[i]&&c[i];
	end
end

endmodule