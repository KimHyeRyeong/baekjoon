`define READ 1'b1
`define WRITE 1'b0

`define ADD 5'b00000
`define ADDI 5'b00001
`define SUB 5'b00010
`define SUBI 5'b00011
`define MOV 5'b00100
`define MOVI 5'b00101

`define SHL 5'b00110
`define SHLI 5'b00111
`define ASR 5'b01000
`define ASRI 5'b01001
`define LSR 5'b01010
`define LSRI 5'b01011
`define ROL 5'b01100
`define ROLI 5'b01101
`define ROR 5'b01110
`define RORI 5'b01111

`define AND 5'b10000
`define ANDI 5'b10001 //17
`define OR 5'b10010 //16+2
`define ORI 5'b10011 //19
`define NOT 5'b10100 //20


`define add 4'b0000
`define sub 4'b0001
`define shl 4'b0010
`define asr 4'b0011
`define lsr 4'b0100
`define rol 4'b0101
`define ror 4'b0110
`define and 4'b1000
`define or 	4'b1001
`define not 4'b1010


module decoder(instr, unary,sgned, imode, aluop, setcc, rD, rA, rB, imm, wben);

	input[15:0] instr;
	
	output unary;
	output sgned;
	output imode;
	output[3:0] aluop;
	output setcc;
	output[2:0] rD;
	output[2:0] rA;
	output[2:0] rB;
	output[3:0] imm;
	output wben;
	
	reg unary;
	reg sgned;
	reg imode;
	reg [3:0] aluop;
	reg setcc;
	reg [2:0] rD;
	reg [2:0] rA;
	reg [2:0] rB;
	reg [3:0] imm;
	reg wben;
	
	wire [4:0] opcode;
	
	assign opcode = instr[4:0];
	
	always @(instr)
	case (opcode)
		`ADD: {unary, sgned, imode, aluop, setcc, rD, rA, rB, imm, wben}=
				{1'b0, 1'b1, 1'b0, `add, instr[5], instr[8:6], instr[11:9], instr[14:12], 4'bx, 1'b1};
		`ADDI:{unary, sgned, imode, aluop, setcc, rD, rA, rB, imm, wben}=
				{1'b0, 1'b1, 1'b1, `add, instr[5], instr[8:6], instr[11:9], 3'bx, instr[15:12], 1'b1};
				
		`SUB:{unary, sgned, imode, aluop, setcc, rD, rA, rB, imm, wben}=
				{1'b0, 1'b1, 1'b0, `sub, instr[5], instr[8:6], instr[11:9], instr[14:12], 4'bx, 1'b1};
		`SUBI:{unary, sgned, imode, aluop, setcc, rD, rA, rB, imm, wben}=
				{1'b0, 1'b1, 1'b1, `sub, instr[5], instr[8:6], instr[11:9], 3'bx, instr[15:12], 1'b1};
		
		`MOV :{unary, sgned, imode, aluop, setcc, rD, rA, rB, imm, wben}=
				{1'b1, 1'b1, 1'b0, `add, instr[5], instr[8:6], 3'bx, instr[14:12], 4'bx, 1'b1};
		`MOVI:{unary, sgned, imode, aluop, setcc, rD, rA, rB, imm, wben}=
				{1'b1, 1'b1, 1'b1, `add, instr[5], instr[8:6], 3'bx, 3'bx, instr[15:12], 1'b1};
		//add, sub, mov
		
		`SHL:{unary, sgned, imode, aluop, setcc, rD, rA, rB, imm, wben}=
				{1'b0, 1'b0, 1'b0, `shl, instr[5], instr[8:6], instr[11:9], instr[14:12], 4'bx, 1'b1};
		`SHLI:{unary, sgned, imode, aluop, setcc, rD, rA, rB, imm, wben}=
				{1'b0, 1'b0, 1'b1, `shl, instr[5], instr[8:6], instr[11:9], 3'bx, instr[15:12], 1'b1};
				
		`ASR:{unary, sgned, imode, aluop, setcc, rD, rA, rB, imm, wben}=
				{1'b0, 1'b0, 1'b0, `asr, instr[5], instr[8:6], instr[11:9], instr[14:12], 4'bx, 1'b1};
		`ASRI:{unary, sgned, imode, aluop, setcc, rD, rA, rB, imm, wben}=
				{1'b0, 1'b0, 1'b1, `asr, instr[5], instr[8:6], instr[11:9], 3'bx, instr[15:12], 1'b1};
				
		`LSR:{unary, sgned, imode, aluop, setcc, rD, rA, rB, imm, wben}=
				{1'b0, 1'b0, 1'b0, `lsr, instr[5], instr[8:6], instr[11:9], instr[14:12], 4'bx, 1'b1};
		`LSRI:{unary, sgned, imode, aluop, setcc, rD, rA, rB, imm, wben}=
				{1'b0, 1'b0, 1'b1, `lsr, instr[5], instr[8:6], instr[11:9], 3'bx, instr[15:12], 1'b1};
				
		`ROL:{unary, sgned, imode, aluop, setcc, rD, rA, rB, imm, wben}=
				{1'b0, 1'b0, 1'b0, `rol, instr[5], instr[8:6], instr[11:9], instr[14:12], 4'bx, 1'b1};
		`ROLI:{unary, sgned, imode, aluop, setcc, rD, rA, rB, imm, wben}=
				{1'b0, 1'b0, 1'b1, `rol, instr[5], instr[8:6], instr[11:9], 3'bx, instr[15:12], 1'b1};
				
		`ROR:{unary, sgned, imode, aluop, setcc, rD, rA, rB, imm, wben}=
				{1'b0, 1'b0, 1'b0, `ror, instr[5], instr[8:6], instr[11:9], instr[14:12], 4'bx, 1'b1};
		`RORI:{unary, sgned, imode, aluop, setcc, rD, rA, rB, imm, wben}=
				{1'b0, 1'b0, 1'b1, `ror, instr[5], instr[8:6], instr[11:9], 3'bx, instr[15:12], 1'b1};
				
		`AND:{unary, sgned, imode, aluop, setcc, rD, rA, rB, imm, wben}=
				{1'b0, 1'b0, 1'b0, `and, instr[5], instr[8:6], instr[11:9], instr[14:12], 4'bx, 1'b1};
		`ANDI:{unary, sgned, imode, aluop, setcc, rD, rA, rB, imm, wben}=
				{1'b0, 1'b0, 1'b1, `and, instr[5], instr[8:6], instr[11:9], 3'bx, instr[15:12], 1'b1};
				
		`OR:{unary, sgned, imode, aluop, setcc, rD, rA, rB, imm, wben}=
				{1'b0, 1'b0, 1'b0, `or, instr[5], instr[8:6], instr[11:9], instr[14:12], 4'bx, 1'b1};
		`ORI:{unary, sgned, imode, aluop, setcc, rD, rA, rB, imm, wben}=
				{1'b0, 1'b0, 1'b1, `or, instr[5], instr[8:6], instr[11:9], 3'bx, instr[15:12], 1'b1};
				
		`NOT:{unary, sgned, imode, aluop, setcc, rD, rA, rB, imm, wben}=
				{1'b1, 1'b0, 1'b0, `not, instr[5], instr[8:6], 3'bx, instr[14:12], 4'bx, 1'b1};				


	endcase

endmodule