module memory (clk, op, addr, data);
	input clk;
	input op;
	input [15:0] addr;
	
	output [15:0] data;
	
	reg[7:0] mem[0:65535];
	
	assign data = {mem[addr], mem[addr+1]};
	
endmodule