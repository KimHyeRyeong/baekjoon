`timescale 1ns/1ps
`define READ 1'b1
`define WRITE 1'b0

module cpu (clk, nRESET);

	input clk;
	input nRESET;
	
	reg[15:0] pc;
	reg[ 3:0] NZCV;
	
	wire[15:0] instr;
	
	wire unary;
	wire sgned;
	wire imode;
	wire[3:0] aluop;
	wire setcc;
	wire[2:0] rD,rA,rB;
	wire[3:0] imm;
	wire wben;
	
	wire[15:0] valA, valB, svalA, svalB, valE;
	wire[ 3:0] cc;
	
	always @(posedge clk or negedge nRESET) begin
		if(!nRESET) pc <= 16'b0;
		else pc <= pc+2;
	end
		
	memory imem(clk, `READ, pc, instr);
	
	decoder idec(instr, unary, sgned, imode, aluop, setcc, rD, rA, rB, imm, wben);
	
	register_file ireg_file(clk, nRESET, wben, rD, valE, rA, rB, valA, valB);
	
	assign svalA = unary ? 16'b0 : valA;
	assign svalB = imode ? sgned ? {{12{imm[3]}}, imm} :
											 {12'b0, imm} : valB;
	ALU ialu(svalA, svalB, aluop, cc, valE);
	
	always @(posedge clk or negedge nRESET) begin
		if (!nRESET) NZCV <= 4'b0;
		else if(setcc) NZCV <= cc;

	end
	
endmodule