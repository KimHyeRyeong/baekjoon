module shift_right (in, shift, out);
	input [15:0] in;
	input [15:0] shift;
	
	output [15:0] out;
	
	wire [15:0] ta;
	wire [15:0] tb;
	wire [15:0] tc;
	wire [15:0] td;

	assign ta = shift[0] ?  {1'b0, in[15:1]} : in;
	assign tb = shift[1] ? 	{2'b0, ta[15:2]} : ta;
	assign tc = shift[2] ? 	{4'b0, tb[15:4]} : tb;
	assign td = shift[3] ? 	{8'b0, tc[15:8]} : tc;

	assign out = td;
endmodule