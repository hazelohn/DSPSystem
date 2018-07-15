`timescale 10ns / 1ps
module booth_multipier_tb;
	wire[31:0] p;
	reg[15:0] a, b;
	
	booth_multiplier  uut(.A(a), .B(b), .P(p));
  
	initial
	
	begin
	   a=0;	   b=0;
	  #10 
		a = 25;		b = 96;
		#10
		a = -16;		b = -63;
		#10
		a = -198;		b = 32123;
		#10
		a = -2;		b = 32767;
		#10
    a = -32768;      b = -32768;
    #10
      a = 32767;      b = 32767;
    #10
      a = 3877;       b = 7062;
    #10
      a = -120;      b = 1011;
    #10
      a = -89;      b = -105;
    #10
      a = -26653;      b = -7987;
    #10
       a = -32768;       b = 32767;
    #20 $stop;
	end
endmodule 
