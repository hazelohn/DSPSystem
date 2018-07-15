module fir(clk,reset,x,en,y,RisingTone,FirEnd);
input RisingTone;
input clk,reset,en;
input[15:0] x;
output[15:0] y;
output FirEnd;
wire[5:0] qAddr;
counterT #(.n(64),.counter_bits(6)) counterT(.clk(clk),.en(1'b1),.r(reset),.q(qAddr),.co(FirEnd));
wire[15:0] in2;
h_rom_l h_rom_l1(.addr(qAddr),.dout(in2),.RisingTone(RisingTone));

wire[31:0] MultiResult;

booth_multiplier booth_multiplier0(.A(x),.B(in2),.P(MultiResult));
wire[31:0] raw_y;
wire[32:0] sumd; 
Naddr #(.N(33)) Naddr(.a({raw_y[31],raw_y}),.b({MultiResult[31],MultiResult}),.s(sumd),.ci(1'b0),.co());

wire[31:0] sum;
assign sum = (sumd[31]==sumd[32])?sumd[31:0]:(sumd[32]?32'h8000_0000:32'h7fff_fff);

dffre #(.WIDTH(32)) dffre32(.d(sum),.en(1'b1),.r(reset),.clk(clk),.q(raw_y));

wire[15:0] tempy;
assign tempy = raw_y[31]?(raw_y[30]?raw_y[30:15] : 16'h8000 ) :(raw_y[30]? 16'h7fff: raw_y[30:15]) ;

dffre #(.WIDTH(16)) dffre33(.d(tempy),.en(en),.r(1'b0),.clk(clk),.q(y));




endmodule