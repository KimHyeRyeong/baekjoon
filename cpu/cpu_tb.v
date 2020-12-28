`timescale 1ns/ 1ps
module cpu_tb;

	reg clk, nRESET;
	
	always
		#2.5 clk = ~clk;
		
	cpu icpu(.clk(clk), .nRESET(nRESET));

	initial begin

		$readmemb("my_program.txt", icpu.imem.mem);
		clk = 1'b1;
		nRESET = 1'b1;
		
		#5 nRESET = 1'b0;
		#5 nRESET = 1'b1;
		
		#50000;
		$finish;
	end
endmodule