module ALU(valA, valB, aluop, cc, result);

	input [15:0] valA;
	input [15:0] valB;
	input [3:0] aluop;
	
	output [3:0] cc;
	output [15:0] result;
	
	wire sub, shift_ov, lr;
	wire [15:0] and16b, or16b, shift_out, add_out, svalB, not16b, 
					xor16b, result, right_shift_out,
					rotator_out, multiply;
	wire add_co;
	wire [3:0] cc;
	wire N, Z, C, V;
	
	assign and16b = valA & valB;
	assign or16b = valA | valB;
	assign not16b = ~valB;
	assign xor16b = valA ^ valB;
	
	assign lr = (aluop == 4'b0010 || aluop == 4'b0101) ? 1'b1 :
					(aluop == 4'b0011 || aluop == 4'b0110) ? 1'b0 : 1'bx;
	barrel_shifter myShifter (valA, valB, lr, shift_ov, shift_out);
	
	assign svalB = (aluop == 4'b0000) ? valB :
						(aluop == 4'b0001) ? ~valB : 16'bx;
	assign sub = (aluop == 4'b0000) ? 0 :
					(aluop == 4'b0001) ? 1 : 1'bx;
						
	adder myAdder (valA, svalB, sub, add_co, add_out);
	
	shift_right right_shift(valA, valB, right_shift_out);
	
	barrel_rotator myRotator(valA, valB, lr, rotator_out);
	
	assign result =
		(aluop == 4'b0000) ? add_out :
		(aluop == 4'b0001) ? add_out :
		(aluop == 4'b0010) ? shift_out : /*shift left*/
		(aluop == 4'b0011) ? shift_out : /*arithmetic shift right*/
		(aluop == 4'b0100) ? right_shift_out : /*logical shift right*/
		(aluop == 4'b0101) ? rotator_out : /*rotate left*/
		(aluop == 4'b0110) ? rotator_out :  /*rotate right*/
		(aluop == 4'b0111) ? multiply : 
		(aluop == 4'b1000) ? and16b : 
		(aluop == 4'b1001) ? or16b : 
		(aluop == 4'b1010) ? not16b : 
		(aluop == 4'b1011) ? xor16b : 16'bx;
		
	assign N = result[15];
	assign Z = ~|result;
	assign C = (aluop == 4'b0000) & add_co;
	assign V = (aluop == 4'b0010) ? shift_ov :
					(aluop == 4'b0000 || aluop ==4'b0001) ?
					(~valA[15] & ~svalB[15] & add_out[15]) |
					(valA[15] & svalB[15] & ~add_out[15]) : 1'b0;
					
	assign cc = {N, Z, C, V};
	
endmodule