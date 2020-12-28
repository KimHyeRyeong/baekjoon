module barrel_shifter (in, shift, lr,ov, out);
	input [15:0] shift;
	input [15:0] in;
	input lr;
	
	output ov;
	output [15:0] out;
	
	wire [15:0] ta;
	wire [15:0] tb;
	wire [15:0] tc;
	wire [15:0] td;
	
	assign ta = shift[0] ? (lr ? {in[14:0], 1'b0} : {in[15] ? 1'b1 : 1'b0, in[15:1]}) : in; /*lr == 1 left, lr == 0 right*/
	assign tb = shift[1] ? (lr ? {ta[13:0], 2'b0} : {in[15] ? 2'b11 : 2'b00, ta[15:2]}) : ta;
	assign tc = shift[2] ? (lr ? {tb[11:0], 4'b0} : {in[15] ? 4'b1111 : 4'b0000, tb[15:4]}) : tb;
	assign td = shift[3] ? (lr ? {tc[7:0], 8'b0} : {in[15] ? 8'b11111111 : 8'b00000000, tc[15:8]}) : tc;
	
	assign out = td;
	assign ov = lr ? ((in[15]!=out[15]) ? 1'b1 : 1'b0 ): 1'b0;

endmodule