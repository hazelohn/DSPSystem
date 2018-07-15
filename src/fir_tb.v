`timescale 1ns/10ps
module fir_tb;
   parameter DELY=40;
   reg clk,  reset, sample;
   reg[15:0] xIn; // reg[15:0] x_temp;
   integer i; 
   wire [15:0] yOut;
  //  fir  instance  fir(clk, reset, xIn, sample, yOut);
    fir fir_inst(
    .clk(clk), 
    .reset(reset), 
    .xIn(xIn), //
    .yOut(yOut),
    .sample(sample));
   //clk??????
  initial begin clk = 0;forever #(DELY/2) clk = ~clk;end
  reg [15:0] buffer[0:1023] ; //???????????
  initial 
  begin 
  $readmemh("D:\\Under3Second\\fpga\\src\\src\\fir_in.txt",buffer);
   reset = 1;
   sample=0;
   #(DELY*2+1)	  reset = 0; 
     for (i=0;i<=1023;i=i+1)
       begin
       #(DELY*32) sample=1; 
                 xIn=buffer[i];
       #(DELY)    sample=0;
     end
     #(DELY*2) $stop;
  end
endmodule



