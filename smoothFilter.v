module smoothFilter(RisingTone,sys_clk,ready,reset,Outa,Outd,OutBufWea,SampleOut);
input RisingTone,sys_clk,ready,reset；
input[15:0] Outd;
input[9:0] Outa;
input OutBufWea;
output SampleOut;

wire[9:0] n;
wire[7:0] factor2,factor1;
wire stage1;
wire smooth;
wire[9:0] NextAddr;
signalGenerate signalGenerate0(.RisingTone(RisingTone),
	.n(n),
	.factor1(factor1),
	.factor2(factor2),
	.stage1(stage1),
	.smooth(smooth),
	.NextAddr(NextAddr));

smoothController smoothController0(
	.stage1(stage1),
	.smooth(smooth),
	.sys_clk(sys_clk),
	.reset(reset),
	.ready(ready),
	.FactorSel(FactorSel),
	.SClr(SClr),
	.OutEn(OutEn),
	.AddrSel(AddrSel));
counterT #(.n(768),.counter_bits(10)) counter3(.clk(sys_clk),.en(ready),.r(reset),.q(n),.co());

wire[9:0] dpra;
assign dpra = AddrSel?NextAddr:n;

wire[15:0] RAMOut;

InOutbuf InOutbuf1(.a(Outa),
    .d(Outd),
    .dpra(dpra),
    .clk(sys_clk),
    .we(OutBufWea),
    .qdpo(RAMOut));

wire[7:0] factor;
assign factor = FactorSel?factor2:factor1;

wire[31:0] mu;

booth_multiplier booth_multiplier0(
	.A(RAMOut),
	.B({8'b0,factor}),
	.P(mu)
	);

wire[23:0] tmpQ,tmpD;

Naddr #(.N(24)) Naddr0(.a(mu[23:0]),.b(tmpQ),.s(tmpD),.ci(1'b0),.co());

dffre #(.WIDTH(24)) dffre0(.d(tmpD),.en(1'b1),.r(SClr),.clk(sys_clk),.q(tmpQ));

dffre #(.WIDTH(16)) dffre1(.d(smooth?tmpQ[23:8]:RAMOut),.en(OutEn),.r(1'b0),.clk(sys_clk),.q(SampleOut));

endmodule