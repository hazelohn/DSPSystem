module signalGenerate(RisingTone,n,factor1,factor2,stage1,smooth,NextAddr);
input RisingTone;
input[9:0] n;
output[7:0] factor2,factor1;
output stage1;
output smooth;
output[9:0] NextAddr;

assign stage1 = ~n[9]||(~|n[8:0]) ;
assign smooth = RisingTone?(~stage1)&&(n[9:6]==8):~stage1;
assign factor2 = RisingTone?{n[5:0],2'b00}:n[7:0];
assign factor1 = ~factor2+1;
assign NextAddr = RisingTone?(n+(~192)+1):(n+256);

endmodule